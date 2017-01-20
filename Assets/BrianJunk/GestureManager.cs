using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Leap.Unity;

public class GestureManager : MonoBehaviour 
{
	//singleton
	public static GestureManager instance = null;
	void Awake()
	{
		if (instance == null) 
		{
			instance = this;
		} 
		else if (instance != this) 
		{
			Destroy (gameObject);
		}
		DontDestroyOnLoad (gameObject);
	}
	//end singleton

	//Wrist Menu
	public GameObject wristMenu;

	//Holds all player spawned objects
	public List<GameObject> allPlayerCreatedObjects = new List<GameObject>();

	//Locations of palms
	public Transform rPalmTrans;
	public Transform lPalmTrans;
	//locations of pinch (Thumb and Index fingers)
	public Transform rPinchTrans;
	public Transform lPinchTrans;

	//pinch particles
	public TogglePinchParticles rPinchParticles;
	public TogglePinchParticles lPinchParticles;

	//Starting positions of gestures
	private Vector3 initialPalmPositionOnGesture;

	//bool to keep track if we are tracking the current gestures transform movement
	private bool isTrackingEnableGravityGesture = false;
	private bool isTrackingDisableGravityGesture = false;
	//The current position of the palms in world space
	private Vector3 currentPalmPosition;

	//height required for movement tracking gestures to fire
	public float gestureHeightRequirement = 0.15f;
	//minimum distance between both hands pinches to start creating an object
	public float pinchDistanceRequirement = 0.08f;

	#region List of bools if specific subgestures are active Ture = active False = inactive
	//Palm Bools
	private bool isRPalmUp = false;
	private bool isRPalmDown = false;
	private bool isLPalmUp = false;
	private bool isLPalmDown = false;
	//Finger Bools
	private bool isRFingersExtended = false;
	private bool isLFingersExtended = false;
	//Pinch Bools
	private bool isRPinching = false;
	private bool isLPinching = false;
	#endregion

	#region Detection Funtions Called by hand states
	//called by the palm detection
	public void SetRightPalmActiveUp()
	{
		isRPalmUp = true;
	}
	//called by the palm detection
	public void SetLeftPalmActiveUp()
	{
		isLPalmUp = true;

	}
	//called by the palm detection
	public void SetRightPalmActiveDown()
	{
		isRPalmDown = true;
	}
	//called by the palm detection
	public void SetLeftPalmActiveDown()
	{
		isLPalmDown = true;
	}

	//called by the palm detection
	public void SetRightPalmInactiveUp()
	{
		isRPalmUp = false;
	}
	//called by the palm detection
	public void SetLeftPalmInactiveUp()
	{
		isLPalmUp = false;
	}
	//called by the palm detection
	public void SetRightPalmInactiveDown()
	{
		isRPalmDown = false;
	}
	//called by the palm detection
	public void SetLeftPalmInactiveDown()
	{
		isLPalmDown = false;
	}

	//called by finger extened detection
	public void SetRightFingerExtendActive()
	{
		isRFingersExtended = true;
	}
	//called by finger extened detection
	public void SetLeftFingerExtendActive()
	{
		isLFingersExtended = true;
	}
	public void SetRightFingerExtendInactive()
	{
		isRFingersExtended = false;
	}
	//called by finger extened detection
	public void SetLeftFingerExtendInactive()
	{
		isLFingersExtended = false;
	}
	//called by pinch detection
	public void SetRightPinchActive()
	{
		isRPinching = true;
	}
	//called by pinch detection
	public void SetRightPinchInactive()
	{
		isRPinching = false;
	}
	//called by pinch detection
	public void SetLeftPinchActive()
	{
		isLPinching = true;
	}
	//called by pinch detection
	public void SetLeftPinchInactive()
	{
		isLPinching = false;
	}
	#endregion

	#region All custom gestures
	void Update()
	{
		//Turn Off Gravity Gesture
		if (isRPalmUp && isLPalmUp && isRFingersExtended && isLFingersExtended) 
		{
			if (isTrackingEnableGravityGesture == false) 
			{
				initialPalmPositionOnGesture = (rPalmTrans.position + lPalmTrans.position) / 2;
				//sets that we are tracking Gestures
				isTrackingEnableGravityGesture = true;
			}

			//keeps track of current palm position to compare with the inital palm position
			currentPalmPosition = (rPalmTrans.position + lPalmTrans.position) / 2;

			//compares the initial palm location to the one we are tracking if the movement is upwards by X amount, the gesture fires
			//print("Initial Palm Y = " + initialPalmPositionOnGesture.y + "  ::: currentPalm Y = " + currentPalmPosition.y + "  :::  additional height = " + gestureHeightRequirement);
			if (initialPalmPositionOnGesture.y + gestureHeightRequirement < currentPalmPosition.y) 
			{
				GravityControl.instance.ChangeGrav (false);
			}
		} 
		else 
		{
			isTrackingEnableGravityGesture = false;
		}

		//Activate Gravity Gesture
		if (isRPalmDown && isLPalmDown && isRFingersExtended && isLFingersExtended) 
		{
			if (isTrackingDisableGravityGesture == false)
			{
				initialPalmPositionOnGesture = (rPalmTrans.position + lPalmTrans.position) / 2;
				//sets that we are tracking Gestures
				isTrackingDisableGravityGesture = true;
			}

			//keeps track of current palm position to compare with the inital palm position
			currentPalmPosition = (rPalmTrans.position + lPalmTrans.position) / 2;

			//compares the initial palm location to the one we are tracking if the movement is upwards by X amount, the gesture fires
			if (initialPalmPositionOnGesture.y - gestureHeightRequirement > currentPalmPosition.y) 
			{
				GravityControl.instance.ChangeGrav (true);
			}
		} 
		else 
		{
			isTrackingDisableGravityGesture = false;
		}

		//toggle Pinch Particles
		if (isLPinching)
			lPinchParticles.ActivatePinchParticles ();
		if (!isLPinching && lPinchParticles.gameObject.activeInHierarchy)
			lPinchParticles.DeactivatePinchParticles ();
		if (isRPinching)
			rPinchParticles.ActivatePinchParticles ();
		if (!isRPinching && rPinchParticles.gameObject.activeInHierarchy)
			rPinchParticles.DeactivatePinchParticles ();

		//Create Object Gesture
		if (isLPinching && isRPinching) 
		{
			float distanceBetweenHands = (rPinchTrans.position - lPinchTrans.position).magnitude;

			//initial object creation
			if (isRPinching && isLPinching  && distanceBetweenHands <= pinchDistanceRequirement) 
			{
				SpawnObject.instance.CreateObject ();
			}

			if (isRPinching && isLPinching && SpawnObject.instance.currentlySelectedObj != null && allPlayerCreatedObjects.Count > 0) 
			{
				//sends the most recently created object to be resized along with the  pinch positions in world space
				SpawnObject.instance.ResizeObject (allPlayerCreatedObjects [allPlayerCreatedObjects.Count - 1], lPinchTrans.position, rPinchTrans.position, distanceBetweenHands);
			}
		}

		//End Object Creation Gesture
		if (isLPinching || isRPinching) 
		{
			SpawnObject.instance.SolidifyObject ();
		}

		//Bring Up Menu Gesture
		if (isLPalmUp && wristMenu.activeInHierarchy == false && !isRPalmUp) 
		{
			wristMenu.SetActive (true);
		}
		//Closing Menu Gesture
		if (!isLPalmUp && wristMenu.activeInHierarchy == true) 
		{
			wristMenu.SetActive (false);
		}
	}
	#endregion

	//when an object is solidified it is added to this list by the spawn object
	public void AddObjectToList(GameObject playerCreatedObj)
	{
		allPlayerCreatedObjects.Add (playerCreatedObj);
	}
}
