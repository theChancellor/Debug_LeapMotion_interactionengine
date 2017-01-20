// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.30 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.30;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|diff-1304-RGB,normal-1531-RGB,emission-7184-OUT,clip-4177-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:31780,y:32177,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3,c2:0.3,c3:0.3,c4:1;n:type:ShaderForge.SFN_Slider,id:7366,x:30429,y:32689,ptovrint:False,ptlb:GlowAmount,ptin:_GlowAmount,varname:node_7366,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Smoothstep,id:1722,x:30954,y:32868,varname:node_1722,prsc:2|A-1318-OUT,B-9621-OUT,V-7366-OUT;n:type:ShaderForge.SFN_Vector1,id:1318,x:30634,y:32810,varname:node_1318,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:9621,x:30634,y:32860,varname:node_9621,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector3,id:5983,x:30856,y:32386,varname:node_5983,prsc:2,v1:1,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:3731,x:30856,y:32496,varname:node_3731,prsc:2,v1:1,v2:0.5,v3:0;n:type:ShaderForge.SFN_Lerp,id:662,x:31054,y:32416,varname:node_662,prsc:2|A-3731-OUT,B-5983-OUT,T-7366-OUT;n:type:ShaderForge.SFN_Lerp,id:8823,x:31234,y:32606,varname:node_8823,prsc:2|A-662-OUT,B-1722-OUT,T-7366-OUT;n:type:ShaderForge.SFN_Tex2d,id:8876,x:31541,y:32387,varname:node_8876,prsc:2,tex:6b46f0a4c70ec2946b348aab16f55e72,ntxv:0,isnm:False|TEX-4741-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:4741,x:31302,y:32364,ptovrint:False,ptlb:GlowAreaMask,ptin:_GlowAreaMask,varname:node_4741,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6b46f0a4c70ec2946b348aab16f55e72,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7184,x:31638,y:32643,varname:node_7184,prsc:2|A-8876-RGB,B-8823-OUT;n:type:ShaderForge.SFN_Tex2d,id:1531,x:31559,y:32935,varname:node_1531,prsc:2,tex:66be8df3e9eaccd4fa06f8a98086f85c,ntxv:0,isnm:False|TEX-8608-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:8608,x:31302,y:32960,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_8608,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:66be8df3e9eaccd4fa06f8a98086f85c,ntxv:3,isnm:True;n:type:ShaderForge.SFN_ComponentMask,id:4177,x:32514,y:32990,varname:node_4177,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-6075-OUT;n:type:ShaderForge.SFN_Slider,id:3356,x:31549,y:33231,ptovrint:False,ptlb:BodyOpacity,ptin:_BodyOpacity,varname:node_3356,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Lerp,id:6075,x:32140,y:33050,varname:node_6075,prsc:2|A-8173-OUT,B-7184-OUT,T-3356-OUT;n:type:ShaderForge.SFN_Vector1,id:8173,x:31943,y:33015,varname:node_8173,prsc:2,v1:1;proporder:1304-7366-4741-8608-3356;pass:END;sub:END;*/

Shader "Shader Forge/HighlightEdges" {
    Properties {
        _Color ("Color", Color) = (0.3,0.3,0.3,1)
        _GlowAmount ("GlowAmount", Range(0, 1)) = 0
        _GlowAreaMask ("GlowAreaMask", 2D) = "white" {}
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _BodyOpacity ("BodyOpacity", Range(0, 1)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _Color;
            uniform float _GlowAmount;
            uniform sampler2D _GlowAreaMask; uniform float4 _GlowAreaMask_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _BodyOpacity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 node_1531 = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 normalLocal = node_1531.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float node_8173 = 1.0;
                float4 node_8876 = tex2D(_GlowAreaMask,TRANSFORM_TEX(i.uv0, _GlowAreaMask));
                float node_1722 = smoothstep( 1.0, 0.0, _GlowAmount );
                float3 node_7184 = (node_8876.rgb*lerp(lerp(float3(1,0.5,0),float3(1,0,0),_GlowAmount),float3(node_1722,node_1722,node_1722),_GlowAmount));
                float node_4177 = lerp(float3(node_8173,node_8173,node_8173),node_7184,_BodyOpacity).r;
                clip(node_4177 - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuseColor = _Color.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = node_7184;
/// Final Color:
                float3 finalColor = diffuse + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _Color;
            uniform float _GlowAmount;
            uniform sampler2D _GlowAreaMask; uniform float4 _GlowAreaMask_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _BodyOpacity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 node_1531 = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 normalLocal = node_1531.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float node_8173 = 1.0;
                float4 node_8876 = tex2D(_GlowAreaMask,TRANSFORM_TEX(i.uv0, _GlowAreaMask));
                float node_1722 = smoothstep( 1.0, 0.0, _GlowAmount );
                float3 node_7184 = (node_8876.rgb*lerp(lerp(float3(1,0.5,0),float3(1,0,0),_GlowAmount),float3(node_1722,node_1722,node_1722),_GlowAmount));
                float node_4177 = lerp(float3(node_8173,node_8173,node_8173),node_7184,_BodyOpacity).r;
                clip(node_4177 - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 diffuseColor = _Color.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float _GlowAmount;
            uniform sampler2D _GlowAreaMask; uniform float4 _GlowAreaMask_ST;
            uniform float _BodyOpacity;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float node_8173 = 1.0;
                float4 node_8876 = tex2D(_GlowAreaMask,TRANSFORM_TEX(i.uv0, _GlowAreaMask));
                float node_1722 = smoothstep( 1.0, 0.0, _GlowAmount );
                float3 node_7184 = (node_8876.rgb*lerp(lerp(float3(1,0.5,0),float3(1,0,0),_GlowAmount),float3(node_1722,node_1722,node_1722),_GlowAmount));
                float node_4177 = lerp(float3(node_8173,node_8173,node_8173),node_7184,_BodyOpacity).r;
                clip(node_4177 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
