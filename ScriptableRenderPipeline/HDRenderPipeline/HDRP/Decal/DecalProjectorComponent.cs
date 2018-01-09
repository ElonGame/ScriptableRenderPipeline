﻿using System;
using UnityEditor;
using UnityEngine;

namespace UnityEngine.Experimental.Rendering.HDPipeline
{
    [ExecuteInEditMode]
    public class DecalProjectorComponent : MonoBehaviour
    {
        private static readonly int m_WorldToDecal = Shader.PropertyToID("_WorldToDecal");
        private static readonly int m_DecalToWorldR = Shader.PropertyToID("_DecalToWorldR");

        public Material m_Material;
        private MaterialPropertyBlock m_PropertyBlock;
        public const int kInvalidIndex = -1;
        private int m_CullIndex = kInvalidIndex;

        // normal space  __x  to decal space __x 
        //              |\                  |\      
        //              y z                 z y        
        //                                    
        private static Matrix4x4 m_NormalToDecal = Matrix4x4.Scale(new Vector3(1.0f, 1.0f, -1.0f)) * Matrix4x4.Rotate(Quaternion.AngleAxis(-90.0f, new Vector3(1, 0, 0))); 

        public int CullIndex
        {
            get
            {
                return this.m_CullIndex;
            }
            set
            {
                this.m_CullIndex = value;
            }
        }

        public void OnEnable()
        {
            DecalSystem.instance.AddDecal(this);
        }

        public void Start()
        {
            m_PropertyBlock = new MaterialPropertyBlock();
            DecalSystem.instance.AddDecal(this);
        }

        public void OnDisable()
        {
            DecalSystem.instance.RemoveDecal(this);
        }

        public void OnValidate()
        {
            BoundingSphere sphere = DecalSystem.instance.GetDecalProjectBoundingSphere(transform.localToWorldMatrix);
            if (m_Material != null)
            {
                Shader shader = m_Material.shader;
                if((shader != null) &&  (shader.name != "HDRenderPipeline/Decal"))
                {
                    Debug.LogWarning("Decal projector component material is not using HDRenderPipeline/Decal shader.", this);
                }
            }
        }

        private void DrawGizmo(bool selected)
        {
            var col = new Color(0.0f, 0.7f, 1f, 1.0f);
            col.a = selected ? 0.3f : 0.1f;
            Gizmos.color = col;
            Matrix4x4 offset = Matrix4x4.Translate(new Vector3(0.0f, -0.5f, 0.0f));
            Gizmos.matrix = transform.localToWorldMatrix * offset;
            Gizmos.DrawCube(Vector3.zero, Vector3.one);
            col.a = selected ? 0.5f : 0.2f;
            Gizmos.color = col;
            Gizmos.DrawWireCube(Vector3.zero, Vector3.one);
        }

        public void OnDrawGizmosSelected()
        {
            DrawGizmo(true);
            // if this object is selected there is a chance the transform was changed so update culling info
            DecalSystem.instance.UpdateBoundingSphere(this);
        }

		public void UpdatePropertyBlock(Vector3 cameraPos)
        {
            Matrix4x4 CRWStoAWS = new Matrix4x4();
            if (ShaderConfig.s_CameraRelativeRendering == 1)
            {
				CRWStoAWS = Matrix4x4.Translate(cameraPos);
            }
            else
            {
                CRWStoAWS = Matrix4x4.identity;
            }

            Matrix4x4 final = transform.localToWorldMatrix;
            Matrix4x4 decalToWorldR = Matrix4x4.Rotate(transform.rotation) * m_NormalToDecal;
            Matrix4x4 worldToDecal = Matrix4x4.Translate(new Vector3(0.5f, 0.0f, 0.5f)) * Matrix4x4.Scale(new Vector3(1.0f, -1.0f, 1.0f)) * final.inverse;
            if (m_PropertyBlock == null)
            {
                m_PropertyBlock = new MaterialPropertyBlock();
            }
            m_PropertyBlock.SetMatrix(m_DecalToWorldR, decalToWorldR);
            m_PropertyBlock.SetMatrix(m_WorldToDecal, worldToDecal * CRWStoAWS);
        }

        public MaterialPropertyBlock GetPropertyBlock()
        {
            return m_PropertyBlock;
        }
    }
}
