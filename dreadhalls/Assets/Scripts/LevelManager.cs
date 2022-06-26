using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LevelManager : MonoBehaviour
{
    
    public static int CurLevel { get; set; } = 0;

    private Text levelText;

    private void Update()
    {
        if (levelText == null)
        {
            levelText = GameObject.Find("LevelText").GetComponent<Text>();
        }

        if (levelText != null)
        {
            levelText.text = $"Level {CurLevel}";
        }
    }
}
