---
title: Unity 3D
layout: note
---

## Terrain

http://docs.unity3d.com/Documentation/Manual/Terrains.html

## Water

http://docs.unity3d.com/Documentation/Manual/HOWTO-Water.html

## Rigidbodies and Colliders

> Rigidbodies allow objects to be controlled by physics, Colliders allow objects to collide with each other.

## Scripting

- Awake = run when a scene is loaded
- Start = run just before the first call to an Update or a FixedUpdate function
- All Awake functions are called before any Start functions are called.

Example:

	GameObject.Find("OtherObjectName").GetComponent<Transform>.Translate(h,v,0);

### Coroutines & Yield



### Triggers with Colliders

- give the game object a Collider component, such as a CapsuleCollider
- check `Is Trigger` in the Collider component
- add code to handle `OnTriggerEnter` method

      using UnityEngine;
      using System.Collections;

      public class MoneyCylinder : MonoBehaviour {
                          
        void OnTriggerEnter(Collider other) {
          // Code here                                                  
        }
      }

## Resources

- [Unity 3D](http://unity3d.com/)
- [Unity 3D Manual](http://docs.unity3d.com/Documentation/Manual/)
- [Unity 3D Components](http://docs.unity3d.com/Documentation/Components/)
- [Unity 3D Scripting Reference](http://docs.unity3d.com/Documentation/ScriptReference/)
- [Unity 3D Answers](http://answers.unity3d.com/)
- [Unity 3D Forms](http://forum.unity3d.com/)
- [Unity 3D Wiki](http://wiki.unity3d.com/)
- [Unify Community](http://unifycommunity.com/)
- [Unity 3D Student](http://www.unity3dstudent.com/)
- [Learn Unity3D](http://learnunity3d.com/)
- [Unity Workshop](http://www.unityworkshop.com/)
- [UnityGems](http://unitygems.com/)
- [GameDev StackExchange - Unity](http://gamedev.stackexchange.com/questions/tagged/unity)
- [3D Buzz - Unity](http://www.3dbuzz.com/vbforum/sv_videonav.php?fid=808bf515c69066eb13df7952c0d54711)
- [Walker Boys Studio - Unity Tutorials](http://walkerboystudio.com/html/tutorials.html)
- [IndieDB Unity Devs Group](http://www.indiedb.com/groups/unity-devs/)

