using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Leap.Unity;

public class SpawnObject : MonoBehaviour 
{
	//singleton
	public static SpawnObject instance = null;

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


	//list of spawnable objects set in editor
	public GameObject[] spawnableObjects;

	public GravityControl gravControl;
	public GameObject rightHand;
	public GameObject leftHand;
	public Transform rPinchTrans;
	public Transform lPinchTrans;

	//index of currently spawning object
	private int spawnObjIndex = 0;

	//Gesture Detection for spawning objects
	private PinchDetector rPinchDetect;
	private PinchDetector lPinchDetect;

	//cariable to keep track of which object is currently being spawned
	public GameObject currentlySelectedObj;

	//boilerplate values
	private float minDistance = 0.0f;
	private float maxDistance = 0.8f;
	private Vector3 initObjectRot;
	private float normDist;

	void Start () 
	{
		rPinchDetect = rightHand.GetComponent<PinchDetector> ();
		lPinchDetect = leftHand.GetComponent<PinchDetector> ();
	}

	public void CreateObject()
	{
		if (currentlySelectedObj == null) 
		{
			currentlySelectedObj = Instantiate (spawnableObjects [spawnObjIndex]);
			currentlySelectedObj.transform.SetParent (gameObject.transform);
		}

		GestureManager.instance.AddObjectToList(currentlySelectedObj);
	}

	public void ResizeObject(GameObject objToResize, Vector3 lPinchPos, Vector3 rPinchPos, float distBetweenHands)
	{
		//keeps the object in at the midpoint between both pinching hands
		objToResize.transform.position = lPinchPos + (rPinchPos - lPinchPos) / 2;

		//rotation
		objToResize.transform.localRotation = Quaternion.LookRotation(lPinchPos - rPinchPos, Vector3.forward);

		//scale
		normDist = (distBetweenHands - minDistance) / (maxDistance - minDistance);
		normDist = Mathf.Clamp01 (normDist);

		Vector3 maxScalevec = Vector3.one * currentlySelectedObj.GetComponent<ObjectBehavior>().maxScalableSize;
		Vector3 minScalevec = Vector3.one * currentlySelectedObj.GetComponent<ObjectBehavior>().minScalableSize;

		currentlySelectedObj.transform.localScale = Vector3.Lerp (minScalevec, maxScalevec, normDist);
	}

	public void SolidifyObject()
	{
		if (currentlySelectedObj != null && (rPinchDetect.IsPinching == false || lPinchDetect == false)) 
		{
			currentlySelectedObj.GetComponent<ObjectBehavior> ().SolidifyObject ();
			currentlySelectedObj = null;
		}
	}

	//called by wrist UI button press
	public void ChangeSpawnableObj(int index)
	{
		if(index < spawnableObjects.Length)
			spawnObjIndex = index;
	}
}
