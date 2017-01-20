using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Leap.Unity;

public class TogglePinchParticles : MonoBehaviour 
{
	public PinchDetector pinchDetect;
	private GameObject pinchParticles;

	void Start()
	{
		pinchParticles = gameObject;
		pinchParticles.SetActive (false);
	}

	void Update()
	{
		pinchParticles.transform.position = pinchDetect.Position;
	}

	public void ActivatePinchParticles()
	{
		pinchParticles.SetActive (true);
	}

	public void DeactivatePinchParticles()
	{
		pinchParticles.SetActive (false);
	}

}
