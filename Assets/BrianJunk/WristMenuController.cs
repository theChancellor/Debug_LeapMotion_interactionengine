using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WristMenuController : MonoBehaviour 
{
	void Start()
	{
		//auto disable on start
		if(gameObject.activeInHierarchy)
			gameObject.SetActive (false);
	}

	public void ShowWristMenu()
	{
		gameObject.SetActive (true);
	}
	public void HideWristMenu()
	{
		if(gameObject.activeInHierarchy)
			gameObject.SetActive (false);
	}
}
