//
// This file was automatically generated from Assets/ScriptableRenderLoop/HDRenderLoop/Lighting/LightDefinition.cs.  Please don't edit by hand.
//

#ifndef LIGHTDEFINITION_CS_HLSL
#define LIGHTDEFINITION_CS_HLSL
//
// UnityEngine.Experimental.ScriptableRenderLoop.GPULightType:  static fields
//
#define GPULIGHTTYPE_DIRECTIONAL (0)
#define GPULIGHTTYPE_SPOT (1)
#define GPULIGHTTYPE_POINT (2)
#define GPULIGHTTYPE_PROJECTOR_ORTHO (3)
#define GPULIGHTTYPE_PROJECTOR_PYRAMID (4)
#define GPULIGHTTYPE_RECTANGLE (5)
#define GPULIGHTTYPE_LINE (6)
#define GPULIGHTTYPE_SPHERE (7)
#define GPULIGHTTYPE_DISK (8)
#define GPULIGHTTYPE_HEMISPHERE (9)
#define GPULIGHTTYPE_CYLINDER (10)

//
// UnityEngine.Experimental.ScriptableRenderLoop.EnvShapeType:  static fields
//
#define ENVSHAPETYPE_NONE (0)
#define ENVSHAPETYPE_BOX (1)
#define ENVSHAPETYPE_SPHERE (2)

//
// UnityEngine.Experimental.ScriptableRenderLoop.EnvConstants:  static fields
//
#define ENVCONSTANTS_SPEC_CUBE_LOD_STEP (6)

// Generated from UnityEngine.Experimental.ScriptableRenderLoop.LightData
// PackingRules = Exact
struct LightData
{
	float3 positionWS;
	float invSqrAttenuationRadius;
	float3 color;
	float angleScale;
	float3 forward;
	float angleOffset;
	float3 up;
	float diffuseScale;
	float3 right;
	float specularScale;
	float shadowDimmer;
	int shadowIndex;
	int IESIndex;
	int cookieIndex;
	int lightType;
	float2 size;
	bool twoSided;
};

// Generated from UnityEngine.Experimental.ScriptableRenderLoop.DirectionalLightData
// PackingRules = Exact
struct DirectionalLightData
{
	float3 direction;
	float diffuseScale;
	float3 color;
	float specularScale;
	float cosAngle;
	float sinAngle;
	int shadowIndex;
	float unused;
};

// Generated from UnityEngine.Experimental.ScriptableRenderLoop.PunctualShadowData
// PackingRules = Exact
struct PunctualShadowData
{
	float4x4 worldToShadow;
	int lightType;
	float bias;
	float quality;
	float unused;
};

// Generated from UnityEngine.Experimental.ScriptableRenderLoop.DirectionalShadowData
// PackingRules = Exact
struct DirectionalShadowData
{
	float4x4 worldToShadow;
	float bias;
	float quality;
	float2 unused2;
};

// Generated from UnityEngine.Experimental.ScriptableRenderLoop.EnvLightData
// PackingRules = Exact
struct EnvLightData
{
	float3 positionWS;
	int envShapeType;
	float3 forward;
	float envIndex;
	float3 up;
	float blendDistance;
	float3 right;
	int unused0;
	float3 innerDistance;
	float unused1;
	float3 offsetLS;
	float unused2;
};

//
// Accessors for UnityEngine.Experimental.ScriptableRenderLoop.LightData
//
float3 GetPositionWS(LightData value)
{
	return value.positionWS;
}
float GetInvSqrAttenuationRadius(LightData value)
{
	return value.invSqrAttenuationRadius;
}
float3 GetColor(LightData value)
{
	return value.color;
}
float GetAngleScale(LightData value)
{
	return value.angleScale;
}
float3 GetForward(LightData value)
{
	return value.forward;
}
float GetAngleOffset(LightData value)
{
	return value.angleOffset;
}
float3 GetUp(LightData value)
{
	return value.up;
}
float GetDiffuseScale(LightData value)
{
	return value.diffuseScale;
}
float3 GetRight(LightData value)
{
	return value.right;
}
float GetSpecularScale(LightData value)
{
	return value.specularScale;
}
float GetShadowDimmer(LightData value)
{
	return value.shadowDimmer;
}
int GetShadowIndex(LightData value)
{
	return value.shadowIndex;
}
int GetIESIndex(LightData value)
{
	return value.IESIndex;
}
int GetCookieIndex(LightData value)
{
	return value.cookieIndex;
}
int GetLightType(LightData value)
{
	return value.lightType;
}
float2 GetSize(LightData value)
{
	return value.size;
}
bool GetTwoSided(LightData value)
{
	return value.twoSided;
}

//
// Accessors for UnityEngine.Experimental.ScriptableRenderLoop.DirectionalLightData
//
float3 GetDirection(DirectionalLightData value)
{
	return value.direction;
}
float GetDiffuseScale(DirectionalLightData value)
{
	return value.diffuseScale;
}
float3 GetColor(DirectionalLightData value)
{
	return value.color;
}
float GetSpecularScale(DirectionalLightData value)
{
	return value.specularScale;
}
float GetCosAngle(DirectionalLightData value)
{
	return value.cosAngle;
}
float GetSinAngle(DirectionalLightData value)
{
	return value.sinAngle;
}
int GetShadowIndex(DirectionalLightData value)
{
	return value.shadowIndex;
}
float GetUnused(DirectionalLightData value)
{
	return value.unused;
}

//
// Accessors for UnityEngine.Experimental.ScriptableRenderLoop.PunctualShadowData
//
float4x4 GetWorldToShadow(PunctualShadowData value)
{
	return value.worldToShadow;
}
int GetLightType(PunctualShadowData value)
{
	return value.lightType;
}
float GetBias(PunctualShadowData value)
{
	return value.bias;
}
float GetQuality(PunctualShadowData value)
{
	return value.quality;
}
float GetUnused(PunctualShadowData value)
{
	return value.unused;
}

//
// Accessors for UnityEngine.Experimental.ScriptableRenderLoop.DirectionalShadowData
//
float4x4 GetWorldToShadow(DirectionalShadowData value)
{
	return value.worldToShadow;
}
float GetBias(DirectionalShadowData value)
{
	return value.bias;
}
float GetQuality(DirectionalShadowData value)
{
	return value.quality;
}
float2 GetUnused2(DirectionalShadowData value)
{
	return value.unused2;
}

//
// Accessors for UnityEngine.Experimental.ScriptableRenderLoop.EnvLightData
//
float3 GetPositionWS(EnvLightData value)
{
	return value.positionWS;
}
int GetEnvShapeType(EnvLightData value)
{
	return value.envShapeType;
}
float3 GetForward(EnvLightData value)
{
	return value.forward;
}
float GetEnvIndex(EnvLightData value)
{
	return value.envIndex;
}
float3 GetUp(EnvLightData value)
{
	return value.up;
}
float GetBlendDistance(EnvLightData value)
{
	return value.blendDistance;
}
float3 GetRight(EnvLightData value)
{
	return value.right;
}
int GetUnused0(EnvLightData value)
{
	return value.unused0;
}
float3 GetInnerDistance(EnvLightData value)
{
	return value.innerDistance;
}
float GetUnused1(EnvLightData value)
{
	return value.unused1;
}
float3 GetOffsetLS(EnvLightData value)
{
	return value.offsetLS;
}
float GetUnused2(EnvLightData value)
{
	return value.unused2;
}


#endif