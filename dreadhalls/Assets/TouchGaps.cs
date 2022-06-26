using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class TouchGaps : MonoBehaviour {
	
	void OnControllerColliderHit(ControllerColliderHit hit) {
		if (hit.gameObject.tag == "Gap")
		{
			SceneManager.LoadScene("GameOver");
		}
	}
}
