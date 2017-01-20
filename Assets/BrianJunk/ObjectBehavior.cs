using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent (typeof (Rigidbody))]
public class ObjectBehavior : MonoBehaviour 
{
	public float maxScalableSize = 1.0f;
	public float minScalableSize = 0.05f;

	[SerializeField]
	private bool bStartSolid;
	[SerializeField]
	private float minUpwardForce = 0.00f;
	[SerializeField]
	private float maxUpwardForce = 1.0f;

	private AudioSource impactSound;
	private Material material;
	private Rigidbody rigidBod;
	private Collider col;

	void Start()
	{
		//material assigned here
		material = gameObject.GetComponent<Renderer> ().material;

		//audio source assigned here
		impactSound = gameObject.GetComponent<AudioSource>();

		rigidBod = GetComponent<Rigidbody> ();
		rigidBod.useGravity = false;

		if (bStartSolid)
			SolidifyObject ();
		
		material.SetFloat ("_BodyOpacity", 1.0f);

		//find the appropriate collider on object
		col = GetComponent<Collider> ();
		col.enabled = false;
	}

	void Update()
	{
		//if object is solid and glowing start fading to default state
		if(material.GetFloat("_BodyOpacity") == 0.0f && material.GetFloat("_GlowAmount") < 1.0f)
		{
			material.SetFloat ("_GlowAmount", Mathf.Lerp (material.GetFloat ("_GlowAmount"), 1.0f, Time.deltaTime));
		}
	}

	public void SolidifyObject()
	{
		if(GravityControl.instance.GetGravityState() == true)
			ToggleObjectGravity (true);
		
		col.enabled = true;

		//mass resize with scale
		rigidBod.mass = gameObject.transform.localScale.magnitude;

		//changes shader values to get the solidfy and glow effects to work correctly
		gameObject.GetComponent<Renderer> ().material.SetFloat ("_BodyOpacity", 0.0f);
	}

	public void ToggleObjectGravity(bool isGravOn)
	{
		//sets the material glow high so it begins to fade again
		material.SetFloat("_GlowAmount", 0.0f);

		rigidBod.useGravity = isGravOn;
		if (rigidBod.useGravity == false && IsGrounded (col.bounds.extents.y) == true) 
		{
			rigidBod.AddForce (Vector3.up * (Random.Range (minUpwardForce, maxUpwardForce)));
		} 
		else
			rigidBod.WakeUp ();
	}

	private bool IsGrounded(float distanceToGround)
	{
		return Physics.Raycast (transform.position, -Vector3.up, distanceToGround + 0.1f);
	}

	//controls edge glow on collision
	void OnCollisionEnter(Collision collision)
	{
		//sets the material glow high so it begins to fade again
		material.SetFloat("_GlowAmount", 0.0f);

		//plays sound on impact
//		float forceOfImpact = Vector3.Dot(collision.contacts[0].normal, collision.relativeVelocity) * rigidBod.mass;
//
//
//
//		if (collision.relativeVelocity.magnitude < 1) 
//		{
//			impactSound.volume = collision.relativeVelocity.magnitude/2;
//		} 
//		else
//			impactSound.volume = 0.5f;
//		
//		impactSound.Play ();
	}

}
