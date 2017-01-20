using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Leap.Unity;

//needs to be on the parent that dynamically created objects populate under
public class GravityControl : MonoBehaviour 
{
	//singleton
	public static GravityControl instance = null;

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

	//state at which all the created blocks should be at
	[SerializeField]
	private bool bGravState = true;
	private void SetGravityState(bool b)
	{
		bGravState = b;
	}
	public bool GetGravityState()
	{
		return bGravState;
	}

	//hand transform for tracking Y
	public Transform rPalmTrans;
	public Transform lPalmTrans;
	private Vector3 handStartPos;
	private Vector3 currentPalmPos;


	private List<GameObject> allPlayerCreatedObjects = new List<GameObject>();

	//when an object is solidified it is added to this list by the spawn object
	public void AddObjectToList(GameObject playerCreatedObj)
	{
		allPlayerCreatedObjects.Add (playerCreatedObj);
	}

	//checks that both palms are facing the correct way in order to call the gravity switch on each spawned object
	void Update()
	{
//		//print ("bRPalmActiveUp = " + bRPalmActiveUp + " ::: bLPalmActiveUp = " + bLPalmActiveUp);
//		if (allPlayerCreatedObjects.Count > 0) 
//		{			
//			if (bRPalmActiveUp && bLPalmActiveUp && bRFingerExtendActive && bLFingerExtendActive) 
//			{
//				if (isTrackingGesture == false) 
//				{
//					handStartPos = (rPalmTrans.position + lPalmTrans.position) / 2;
//					//print ("hand start POS = " + handStartPos.y);
//					isTrackingGesture = true;
//				} 
//
//				currentPalmPos = (rPalmTrans.position + lPalmTrans.position) / 2;
//
//				if (handStartPos.y + 0.15f < currentPalmPos.y && isTrackingGesture == true) 
//				{
//					print("hand startPos.y = " + handStartPos.y + " ::: hand current HandPos.y =" + currentPalmPos.y);
//					SetGravityState (false);
//					ChangeGrav ();
//					isTrackingGesture = false;
//				}
//			} 
//			else if (bRPalmActiveDown && bLPalmActiveDown && bRFingerExtendActive && bLFingerExtendActive) 
//			{				
//				SetGravityState (true);
//				ChangeGrav ();
//			}
//		}
	}

	//calls the function that flips the RB gravity on each object based on the global protected bGravState var
	public void ChangeGrav(bool isGravOn)
	{
		if (bGravState != isGravOn) 
		{
			bGravState = isGravOn;
			for (int i = 0; i < GestureManager.instance.allPlayerCreatedObjects.Count; i++) 
			{				
				GestureManager.instance.allPlayerCreatedObjects[i].GetComponent<ObjectBehavior> ().ToggleObjectGravity(bGravState);
				//allPlayerCreatedObjects [i].GetComponent<ObjectBehavior> ().ToggleObjectGravity(bGravState);
			}
		}
	}
}
