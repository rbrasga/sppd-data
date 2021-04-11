//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "DragonFire/UI/CardUI CardArt (preview)" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_AlphaTex ("Sprite Alpha Texture", 2D) = "white" { }
_OverlayTex ("Overlay UI Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "Default"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 14121
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_2 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    vs_TEXCOORD2.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _OverlayTex;
uniform lowp sampler2D _AlphaTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_7;
lowp float u_xlat10_7;
mediump vec3 u_xlat16_11;
float u_xlat18;
void main()
{
    u_xlat0 = vs_TEXCOORD3.xyxy * _MainTex_TexelSize.zwzw + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat1.zw = fract(u_xlat0.zw);
    u_xlat0 = u_xlat0 + (-u_xlat1.zwzw);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.xy = (-u_xlat1.zw) + vec2(1.0, 1.0);
    u_xlat2 = u_xlat1.zwzy * vec4(1.0, 1.0, -1.0, 1.0) + vec4(0.0, 0.0, 1.0, 0.0);
    u_xlat3 = u_xlat1 * u_xlat2.zwxy;
    u_xlat3 = u_xlat2 * u_xlat3.zwxy;
    u_xlat4 = u_xlat3.zwxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.666666687, 0.666666687, 0.666666687, 0.666666687);
    u_xlat1 = (-u_xlat1) * u_xlat2.zwxy + u_xlat4;
    u_xlat1 = u_xlat3 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + u_xlat1;
    u_xlat2 = u_xlat3 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat2 = u_xlat2 / u_xlat1;
    u_xlat2 = u_xlat2 * vec4(1.0, 1.0, -1.0, -1.0) + vec4(1.0, 1.0, 0.0, 0.0);
    u_xlat2 = u_xlat2 * _MainTex_TexelSize.xyxy;
    u_xlat3 = u_xlat0.zwzw * _MainTex_TexelSize.xyxy + u_xlat2.xyzy;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.xyxy + u_xlat2.xwzw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.zw).xyz;
    u_xlat4 = u_xlat1.yyww * u_xlat1.xzxz;
    u_xlat3.xyz = u_xlat10_3.xyz * u_xlat4.yyy;
    u_xlat2.xyz = u_xlat4.xxx * u_xlat10_2.xyz + u_xlat3.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat2.xyz = u_xlat4.zzz * u_xlat10_3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat4.www * u_xlat10_0.xyz + u_xlat2.xyz;
    u_xlat18 = u_xlat4.y + u_xlat4.x;
    u_xlat18 = u_xlat1.x * u_xlat1.w + u_xlat18;
    u_xlat18 = u_xlat1.z * u_xlat1.w + u_xlat18;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat10_1 = texture2D(_OverlayTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat16_5 = (-u_xlat16_1.w) + 1.0;
    u_xlat16_11.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_5) + u_xlat16_11.xyz;
    u_xlat18 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1.xyz = (-u_xlat0.xyz) + vec3(u_xlat18);
    u_xlat0.xyz = vs_TEXCOORD2.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat10_7 = texture2D(_AlphaTex, vs_TEXCOORD0.xy).w;
    u_xlat16_7 = u_xlat10_7 * vs_COLOR0.w;
    u_xlat0.w = u_xlat1.x * u_xlat16_7;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_2 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    vs_TEXCOORD2.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _OverlayTex;
uniform lowp sampler2D _AlphaTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_7;
lowp float u_xlat10_7;
mediump vec3 u_xlat16_11;
float u_xlat18;
void main()
{
    u_xlat0 = vs_TEXCOORD3.xyxy * _MainTex_TexelSize.zwzw + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat1.zw = fract(u_xlat0.zw);
    u_xlat0 = u_xlat0 + (-u_xlat1.zwzw);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.xy = (-u_xlat1.zw) + vec2(1.0, 1.0);
    u_xlat2 = u_xlat1.zwzy * vec4(1.0, 1.0, -1.0, 1.0) + vec4(0.0, 0.0, 1.0, 0.0);
    u_xlat3 = u_xlat1 * u_xlat2.zwxy;
    u_xlat3 = u_xlat2 * u_xlat3.zwxy;
    u_xlat4 = u_xlat3.zwxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.666666687, 0.666666687, 0.666666687, 0.666666687);
    u_xlat1 = (-u_xlat1) * u_xlat2.zwxy + u_xlat4;
    u_xlat1 = u_xlat3 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + u_xlat1;
    u_xlat2 = u_xlat3 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat2 = u_xlat2 / u_xlat1;
    u_xlat2 = u_xlat2 * vec4(1.0, 1.0, -1.0, -1.0) + vec4(1.0, 1.0, 0.0, 0.0);
    u_xlat2 = u_xlat2 * _MainTex_TexelSize.xyxy;
    u_xlat3 = u_xlat0.zwzw * _MainTex_TexelSize.xyxy + u_xlat2.xyzy;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.xyxy + u_xlat2.xwzw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.zw).xyz;
    u_xlat4 = u_xlat1.yyww * u_xlat1.xzxz;
    u_xlat3.xyz = u_xlat10_3.xyz * u_xlat4.yyy;
    u_xlat2.xyz = u_xlat4.xxx * u_xlat10_2.xyz + u_xlat3.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat2.xyz = u_xlat4.zzz * u_xlat10_3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat4.www * u_xlat10_0.xyz + u_xlat2.xyz;
    u_xlat18 = u_xlat4.y + u_xlat4.x;
    u_xlat18 = u_xlat1.x * u_xlat1.w + u_xlat18;
    u_xlat18 = u_xlat1.z * u_xlat1.w + u_xlat18;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat10_1 = texture2D(_OverlayTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat16_5 = (-u_xlat16_1.w) + 1.0;
    u_xlat16_11.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_5) + u_xlat16_11.xyz;
    u_xlat18 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1.xyz = (-u_xlat0.xyz) + vec3(u_xlat18);
    u_xlat0.xyz = vs_TEXCOORD2.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat10_7 = texture2D(_AlphaTex, vs_TEXCOORD0.xy).w;
    u_xlat16_7 = u_xlat10_7 * vs_COLOR0.w;
    u_xlat0.w = u_xlat1.x * u_xlat16_7;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_2 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    vs_TEXCOORD2.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _OverlayTex;
uniform lowp sampler2D _AlphaTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_7;
lowp float u_xlat10_7;
mediump vec3 u_xlat16_11;
float u_xlat18;
void main()
{
    u_xlat0 = vs_TEXCOORD3.xyxy * _MainTex_TexelSize.zwzw + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat1.zw = fract(u_xlat0.zw);
    u_xlat0 = u_xlat0 + (-u_xlat1.zwzw);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.xy = (-u_xlat1.zw) + vec2(1.0, 1.0);
    u_xlat2 = u_xlat1.zwzy * vec4(1.0, 1.0, -1.0, 1.0) + vec4(0.0, 0.0, 1.0, 0.0);
    u_xlat3 = u_xlat1 * u_xlat2.zwxy;
    u_xlat3 = u_xlat2 * u_xlat3.zwxy;
    u_xlat4 = u_xlat3.zwxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.666666687, 0.666666687, 0.666666687, 0.666666687);
    u_xlat1 = (-u_xlat1) * u_xlat2.zwxy + u_xlat4;
    u_xlat1 = u_xlat3 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + u_xlat1;
    u_xlat2 = u_xlat3 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat2 = u_xlat2 / u_xlat1;
    u_xlat2 = u_xlat2 * vec4(1.0, 1.0, -1.0, -1.0) + vec4(1.0, 1.0, 0.0, 0.0);
    u_xlat2 = u_xlat2 * _MainTex_TexelSize.xyxy;
    u_xlat3 = u_xlat0.zwzw * _MainTex_TexelSize.xyxy + u_xlat2.xyzy;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.xyxy + u_xlat2.xwzw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.zw).xyz;
    u_xlat4 = u_xlat1.yyww * u_xlat1.xzxz;
    u_xlat3.xyz = u_xlat10_3.xyz * u_xlat4.yyy;
    u_xlat2.xyz = u_xlat4.xxx * u_xlat10_2.xyz + u_xlat3.xyz;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat2.xyz = u_xlat4.zzz * u_xlat10_3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat4.www * u_xlat10_0.xyz + u_xlat2.xyz;
    u_xlat18 = u_xlat4.y + u_xlat4.x;
    u_xlat18 = u_xlat1.x * u_xlat1.w + u_xlat18;
    u_xlat18 = u_xlat1.z * u_xlat1.w + u_xlat18;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat10_1 = texture2D(_OverlayTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat16_5 = (-u_xlat16_1.w) + 1.0;
    u_xlat16_11.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_5) + u_xlat16_11.xyz;
    u_xlat18 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1.xyz = (-u_xlat0.xyz) + vec3(u_xlat18);
    u_xlat0.xyz = vs_TEXCOORD2.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat10_7 = texture2D(_AlphaTex, vs_TEXCOORD0.xy).w;
    u_xlat16_7 = u_xlat10_7 * vs_COLOR0.w;
    u_xlat0.w = u_xlat1.x * u_xlat16_7;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_2 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    vs_TEXCOORD2.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_TexelSize;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _OverlayTex;
uniform mediump sampler2D _AlphaTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_11;
float u_xlat18;
void main()
{
    u_xlat0 = vs_TEXCOORD3.xyxy * _MainTex_TexelSize.zwzw + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat1.zw = fract(u_xlat0.zw);
    u_xlat0 = u_xlat0 + (-u_xlat1.zwzw);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.xy = (-u_xlat1.zw) + vec2(1.0, 1.0);
    u_xlat2 = u_xlat1.zwzy * vec4(1.0, 1.0, -1.0, 1.0) + vec4(0.0, 0.0, 1.0, 0.0);
    u_xlat3 = u_xlat1 * u_xlat2.zwxy;
    u_xlat3 = u_xlat2 * u_xlat3.zwxy;
    u_xlat4 = u_xlat3.zwxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.666666687, 0.666666687, 0.666666687, 0.666666687);
    u_xlat1 = (-u_xlat1) * u_xlat2.zwxy + u_xlat4;
    u_xlat1 = u_xlat3 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + u_xlat1;
    u_xlat2 = u_xlat3 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat2 = u_xlat2 / u_xlat1;
    u_xlat2 = u_xlat2 * vec4(1.0, 1.0, -1.0, -1.0) + vec4(1.0, 1.0, 0.0, 0.0);
    u_xlat2 = u_xlat2 * _MainTex_TexelSize.xyxy;
    u_xlat3 = u_xlat0.zwzw * _MainTex_TexelSize.xyxy + u_xlat2.xyzy;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.xyxy + u_xlat2.xwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.zw).xyz;
    u_xlat4 = u_xlat1.yyww * u_xlat1.xzxz;
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.yyy;
    u_xlat2.xyz = u_xlat4.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat2.xyz = u_xlat4.zzz * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat4.www * u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat18 = u_xlat4.y + u_xlat4.x;
    u_xlat18 = u_xlat1.x * u_xlat1.w + u_xlat18;
    u_xlat18 = u_xlat1.z * u_xlat1.w + u_xlat18;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat16_1 = texture(_OverlayTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_5 = (-u_xlat16_1.w) + 1.0;
    u_xlat16_11.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_5) + u_xlat16_11.xyz;
    u_xlat18 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1.xyz = (-u_xlat0.xyz) + vec3(u_xlat18);
    u_xlat0.xyz = vs_TEXCOORD2.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat16_7 = texture(_AlphaTex, vs_TEXCOORD0.xy).w;
    u_xlat16_7 = u_xlat16_7 * vs_COLOR0.w;
    u_xlat0.w = u_xlat1.x * u_xlat16_7;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_2 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    vs_TEXCOORD2.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_TexelSize;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _OverlayTex;
uniform mediump sampler2D _AlphaTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_11;
float u_xlat18;
void main()
{
    u_xlat0 = vs_TEXCOORD3.xyxy * _MainTex_TexelSize.zwzw + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat1.zw = fract(u_xlat0.zw);
    u_xlat0 = u_xlat0 + (-u_xlat1.zwzw);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.xy = (-u_xlat1.zw) + vec2(1.0, 1.0);
    u_xlat2 = u_xlat1.zwzy * vec4(1.0, 1.0, -1.0, 1.0) + vec4(0.0, 0.0, 1.0, 0.0);
    u_xlat3 = u_xlat1 * u_xlat2.zwxy;
    u_xlat3 = u_xlat2 * u_xlat3.zwxy;
    u_xlat4 = u_xlat3.zwxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.666666687, 0.666666687, 0.666666687, 0.666666687);
    u_xlat1 = (-u_xlat1) * u_xlat2.zwxy + u_xlat4;
    u_xlat1 = u_xlat3 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + u_xlat1;
    u_xlat2 = u_xlat3 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat2 = u_xlat2 / u_xlat1;
    u_xlat2 = u_xlat2 * vec4(1.0, 1.0, -1.0, -1.0) + vec4(1.0, 1.0, 0.0, 0.0);
    u_xlat2 = u_xlat2 * _MainTex_TexelSize.xyxy;
    u_xlat3 = u_xlat0.zwzw * _MainTex_TexelSize.xyxy + u_xlat2.xyzy;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.xyxy + u_xlat2.xwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.zw).xyz;
    u_xlat4 = u_xlat1.yyww * u_xlat1.xzxz;
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.yyy;
    u_xlat2.xyz = u_xlat4.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat2.xyz = u_xlat4.zzz * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat4.www * u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat18 = u_xlat4.y + u_xlat4.x;
    u_xlat18 = u_xlat1.x * u_xlat1.w + u_xlat18;
    u_xlat18 = u_xlat1.z * u_xlat1.w + u_xlat18;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat16_1 = texture(_OverlayTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_5 = (-u_xlat16_1.w) + 1.0;
    u_xlat16_11.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_5) + u_xlat16_11.xyz;
    u_xlat18 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1.xyz = (-u_xlat0.xyz) + vec3(u_xlat18);
    u_xlat0.xyz = vs_TEXCOORD2.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat16_7 = texture(_AlphaTex, vs_TEXCOORD0.xy).w;
    u_xlat16_7 = u_xlat16_7 * vs_COLOR0.w;
    u_xlat0.w = u_xlat1.x * u_xlat16_7;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_2 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    vs_TEXCOORD2.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_TexelSize;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _OverlayTex;
uniform mediump sampler2D _AlphaTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_11;
float u_xlat18;
void main()
{
    u_xlat0 = vs_TEXCOORD3.xyxy * _MainTex_TexelSize.zwzw + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat1.zw = fract(u_xlat0.zw);
    u_xlat0 = u_xlat0 + (-u_xlat1.zwzw);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.xy = (-u_xlat1.zw) + vec2(1.0, 1.0);
    u_xlat2 = u_xlat1.zwzy * vec4(1.0, 1.0, -1.0, 1.0) + vec4(0.0, 0.0, 1.0, 0.0);
    u_xlat3 = u_xlat1 * u_xlat2.zwxy;
    u_xlat3 = u_xlat2 * u_xlat3.zwxy;
    u_xlat4 = u_xlat3.zwxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.666666687, 0.666666687, 0.666666687, 0.666666687);
    u_xlat1 = (-u_xlat1) * u_xlat2.zwxy + u_xlat4;
    u_xlat1 = u_xlat3 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + u_xlat1;
    u_xlat2 = u_xlat3 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat2 = u_xlat2 / u_xlat1;
    u_xlat2 = u_xlat2 * vec4(1.0, 1.0, -1.0, -1.0) + vec4(1.0, 1.0, 0.0, 0.0);
    u_xlat2 = u_xlat2 * _MainTex_TexelSize.xyxy;
    u_xlat3 = u_xlat0.zwzw * _MainTex_TexelSize.xyxy + u_xlat2.xyzy;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.xyxy + u_xlat2.xwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.zw).xyz;
    u_xlat4 = u_xlat1.yyww * u_xlat1.xzxz;
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.yyy;
    u_xlat2.xyz = u_xlat4.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat2.xyz = u_xlat4.zzz * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat4.www * u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat18 = u_xlat4.y + u_xlat4.x;
    u_xlat18 = u_xlat1.x * u_xlat1.w + u_xlat18;
    u_xlat18 = u_xlat1.z * u_xlat1.w + u_xlat18;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat16_1 = texture(_OverlayTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_5 = (-u_xlat16_1.w) + 1.0;
    u_xlat16_11.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_5) + u_xlat16_11.xyz;
    u_xlat18 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1.xyz = (-u_xlat0.xyz) + vec3(u_xlat18);
    u_xlat0.xyz = vs_TEXCOORD2.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat16_7 = texture(_AlphaTex, vs_TEXCOORD0.xy).w;
    u_xlat16_7 = u_xlat16_7 * vs_COLOR0.w;
    u_xlat0.w = u_xlat1.x * u_xlat16_7;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_2 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    vs_TEXCOORD2.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _OverlayTex;
uniform lowp sampler2D _AlphaTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
mediump float u_xlat16_6;
mediump float u_xlat16_7;
lowp float u_xlat10_7;
mediump vec3 u_xlat16_13;
float u_xlat14;
float u_xlat21;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_7 = texture2D(_AlphaTex, vs_TEXCOORD0.xy).w;
    u_xlat16_7 = u_xlat10_7 * vs_COLOR0.w;
    u_xlat14 = u_xlat16_7 * u_xlat0.x + -0.00100000005;
    u_xlat1.w = u_xlat0.x * u_xlat16_7;
    u_xlatb0.x = u_xlat14<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlat0 = vs_TEXCOORD3.xyxy * _MainTex_TexelSize.zwzw + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat2.zw = fract(u_xlat0.zw);
    u_xlat0 = u_xlat0 + (-u_xlat2.zwzw);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = (-u_xlat2.zw) + vec2(1.0, 1.0);
    u_xlat3 = u_xlat2.zwzy * vec4(1.0, 1.0, -1.0, 1.0) + vec4(0.0, 0.0, 1.0, 0.0);
    u_xlat4 = u_xlat2 * u_xlat3.zwxy;
    u_xlat4 = u_xlat3 * u_xlat4.zwxy;
    u_xlat5 = u_xlat4.zwxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.666666687, 0.666666687, 0.666666687, 0.666666687);
    u_xlat2 = (-u_xlat2) * u_xlat3.zwxy + u_xlat5;
    u_xlat2 = u_xlat4 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + u_xlat2;
    u_xlat3 = u_xlat4 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat3 = u_xlat3 / u_xlat2;
    u_xlat3 = u_xlat3 * vec4(1.0, 1.0, -1.0, -1.0) + vec4(1.0, 1.0, 0.0, 0.0);
    u_xlat3 = u_xlat3 * _MainTex_TexelSize.xyxy;
    u_xlat4 = u_xlat0.zwzw * _MainTex_TexelSize.xyxy + u_xlat3.xyzy;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.xyxy + u_xlat3.xwzw;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat4.zw).xyz;
    u_xlat5 = u_xlat2.yyww * u_xlat2.xzxz;
    u_xlat4.xyz = u_xlat10_4.xyz * u_xlat5.yyy;
    u_xlat3.xyz = u_xlat5.xxx * u_xlat10_3.xyz + u_xlat4.xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat3.xyz = u_xlat5.zzz * u_xlat10_4.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat5.www * u_xlat10_0.xyz + u_xlat3.xyz;
    u_xlat21 = u_xlat5.y + u_xlat5.x;
    u_xlat21 = u_xlat2.x * u_xlat2.w + u_xlat21;
    u_xlat21 = u_xlat2.z * u_xlat2.w + u_xlat21;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat21);
    u_xlat10_2 = texture2D(_OverlayTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_2 + _TextureSampleAdd;
    u_xlat16_6 = (-u_xlat16_2.w) + 1.0;
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_6) + u_xlat16_13.xyz;
    u_xlat21 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(u_xlat21);
    u_xlat1.xyz = vs_TEXCOORD2.xxx * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_2 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    vs_TEXCOORD2.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _OverlayTex;
uniform lowp sampler2D _AlphaTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
mediump float u_xlat16_6;
mediump float u_xlat16_7;
lowp float u_xlat10_7;
mediump vec3 u_xlat16_13;
float u_xlat14;
float u_xlat21;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_7 = texture2D(_AlphaTex, vs_TEXCOORD0.xy).w;
    u_xlat16_7 = u_xlat10_7 * vs_COLOR0.w;
    u_xlat14 = u_xlat16_7 * u_xlat0.x + -0.00100000005;
    u_xlat1.w = u_xlat0.x * u_xlat16_7;
    u_xlatb0.x = u_xlat14<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlat0 = vs_TEXCOORD3.xyxy * _MainTex_TexelSize.zwzw + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat2.zw = fract(u_xlat0.zw);
    u_xlat0 = u_xlat0 + (-u_xlat2.zwzw);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = (-u_xlat2.zw) + vec2(1.0, 1.0);
    u_xlat3 = u_xlat2.zwzy * vec4(1.0, 1.0, -1.0, 1.0) + vec4(0.0, 0.0, 1.0, 0.0);
    u_xlat4 = u_xlat2 * u_xlat3.zwxy;
    u_xlat4 = u_xlat3 * u_xlat4.zwxy;
    u_xlat5 = u_xlat4.zwxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.666666687, 0.666666687, 0.666666687, 0.666666687);
    u_xlat2 = (-u_xlat2) * u_xlat3.zwxy + u_xlat5;
    u_xlat2 = u_xlat4 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + u_xlat2;
    u_xlat3 = u_xlat4 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat3 = u_xlat3 / u_xlat2;
    u_xlat3 = u_xlat3 * vec4(1.0, 1.0, -1.0, -1.0) + vec4(1.0, 1.0, 0.0, 0.0);
    u_xlat3 = u_xlat3 * _MainTex_TexelSize.xyxy;
    u_xlat4 = u_xlat0.zwzw * _MainTex_TexelSize.xyxy + u_xlat3.xyzy;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.xyxy + u_xlat3.xwzw;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat4.zw).xyz;
    u_xlat5 = u_xlat2.yyww * u_xlat2.xzxz;
    u_xlat4.xyz = u_xlat10_4.xyz * u_xlat5.yyy;
    u_xlat3.xyz = u_xlat5.xxx * u_xlat10_3.xyz + u_xlat4.xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat3.xyz = u_xlat5.zzz * u_xlat10_4.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat5.www * u_xlat10_0.xyz + u_xlat3.xyz;
    u_xlat21 = u_xlat5.y + u_xlat5.x;
    u_xlat21 = u_xlat2.x * u_xlat2.w + u_xlat21;
    u_xlat21 = u_xlat2.z * u_xlat2.w + u_xlat21;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat21);
    u_xlat10_2 = texture2D(_OverlayTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_2 + _TextureSampleAdd;
    u_xlat16_6 = (-u_xlat16_2.w) + 1.0;
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_6) + u_xlat16_13.xyz;
    u_xlat21 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(u_xlat21);
    u_xlat1.xyz = vs_TEXCOORD2.xxx * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_2 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    vs_TEXCOORD2.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _OverlayTex;
uniform lowp sampler2D _AlphaTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
mediump float u_xlat16_6;
mediump float u_xlat16_7;
lowp float u_xlat10_7;
mediump vec3 u_xlat16_13;
float u_xlat14;
float u_xlat21;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_7 = texture2D(_AlphaTex, vs_TEXCOORD0.xy).w;
    u_xlat16_7 = u_xlat10_7 * vs_COLOR0.w;
    u_xlat14 = u_xlat16_7 * u_xlat0.x + -0.00100000005;
    u_xlat1.w = u_xlat0.x * u_xlat16_7;
    u_xlatb0.x = u_xlat14<0.0;
    if(((int(u_xlatb0.x) * -1))!=0){discard;}
    u_xlat0 = vs_TEXCOORD3.xyxy * _MainTex_TexelSize.zwzw + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat2.zw = fract(u_xlat0.zw);
    u_xlat0 = u_xlat0 + (-u_xlat2.zwzw);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = (-u_xlat2.zw) + vec2(1.0, 1.0);
    u_xlat3 = u_xlat2.zwzy * vec4(1.0, 1.0, -1.0, 1.0) + vec4(0.0, 0.0, 1.0, 0.0);
    u_xlat4 = u_xlat2 * u_xlat3.zwxy;
    u_xlat4 = u_xlat3 * u_xlat4.zwxy;
    u_xlat5 = u_xlat4.zwxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.666666687, 0.666666687, 0.666666687, 0.666666687);
    u_xlat2 = (-u_xlat2) * u_xlat3.zwxy + u_xlat5;
    u_xlat2 = u_xlat4 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + u_xlat2;
    u_xlat3 = u_xlat4 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat3 = u_xlat3 / u_xlat2;
    u_xlat3 = u_xlat3 * vec4(1.0, 1.0, -1.0, -1.0) + vec4(1.0, 1.0, 0.0, 0.0);
    u_xlat3 = u_xlat3 * _MainTex_TexelSize.xyxy;
    u_xlat4 = u_xlat0.zwzw * _MainTex_TexelSize.xyxy + u_xlat3.xyzy;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.xyxy + u_xlat3.xwzw;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat4.zw).xyz;
    u_xlat5 = u_xlat2.yyww * u_xlat2.xzxz;
    u_xlat4.xyz = u_xlat10_4.xyz * u_xlat5.yyy;
    u_xlat3.xyz = u_xlat5.xxx * u_xlat10_3.xyz + u_xlat4.xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat3.xyz = u_xlat5.zzz * u_xlat10_4.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat5.www * u_xlat10_0.xyz + u_xlat3.xyz;
    u_xlat21 = u_xlat5.y + u_xlat5.x;
    u_xlat21 = u_xlat2.x * u_xlat2.w + u_xlat21;
    u_xlat21 = u_xlat2.z * u_xlat2.w + u_xlat21;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat21);
    u_xlat10_2 = texture2D(_OverlayTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_2 + _TextureSampleAdd;
    u_xlat16_6 = (-u_xlat16_2.w) + 1.0;
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_6) + u_xlat16_13.xyz;
    u_xlat21 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(u_xlat21);
    u_xlat1.xyz = vs_TEXCOORD2.xxx * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_2 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    vs_TEXCOORD2.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_TexelSize;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _OverlayTex;
uniform mediump sampler2D _AlphaTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_13;
float u_xlat14;
float u_xlat21;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_7 = texture(_AlphaTex, vs_TEXCOORD0.xy).w;
    u_xlat16_7 = u_xlat16_7 * vs_COLOR0.w;
    u_xlat14 = u_xlat16_7 * u_xlat0.x + -0.00100000005;
    u_xlat1.w = u_xlat0.x * u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat14<0.0);
#else
    u_xlatb0.x = u_xlat14<0.0;
#endif
    if(((int(u_xlatb0.x) * int(0xffffffffu)))!=0){discard;}
    u_xlat0 = vs_TEXCOORD3.xyxy * _MainTex_TexelSize.zwzw + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat2.zw = fract(u_xlat0.zw);
    u_xlat0 = u_xlat0 + (-u_xlat2.zwzw);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = (-u_xlat2.zw) + vec2(1.0, 1.0);
    u_xlat3 = u_xlat2.zwzy * vec4(1.0, 1.0, -1.0, 1.0) + vec4(0.0, 0.0, 1.0, 0.0);
    u_xlat4 = u_xlat2 * u_xlat3.zwxy;
    u_xlat4 = u_xlat3 * u_xlat4.zwxy;
    u_xlat5 = u_xlat4.zwxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.666666687, 0.666666687, 0.666666687, 0.666666687);
    u_xlat2 = (-u_xlat2) * u_xlat3.zwxy + u_xlat5;
    u_xlat2 = u_xlat4 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + u_xlat2;
    u_xlat3 = u_xlat4 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat3 = u_xlat3 / u_xlat2;
    u_xlat3 = u_xlat3 * vec4(1.0, 1.0, -1.0, -1.0) + vec4(1.0, 1.0, 0.0, 0.0);
    u_xlat3 = u_xlat3 * _MainTex_TexelSize.xyxy;
    u_xlat4 = u_xlat0.zwzw * _MainTex_TexelSize.xyxy + u_xlat3.xyzy;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.xyxy + u_xlat3.xwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat4.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat4.zw).xyz;
    u_xlat5 = u_xlat2.yyww * u_xlat2.xzxz;
    u_xlat4.xyz = u_xlat16_4.xyz * u_xlat5.yyy;
    u_xlat3.xyz = u_xlat5.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat3.xyz = u_xlat5.zzz * u_xlat16_4.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat5.www * u_xlat16_0.xyz + u_xlat3.xyz;
    u_xlat21 = u_xlat5.y + u_xlat5.x;
    u_xlat21 = u_xlat2.x * u_xlat2.w + u_xlat21;
    u_xlat21 = u_xlat2.z * u_xlat2.w + u_xlat21;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat21);
    u_xlat16_2 = texture(_OverlayTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_2 + _TextureSampleAdd;
    u_xlat16_6 = (-u_xlat16_2.w) + 1.0;
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_6) + u_xlat16_13.xyz;
    u_xlat21 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(u_xlat21);
    u_xlat1.xyz = vs_TEXCOORD2.xxx * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_2 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    vs_TEXCOORD2.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_TexelSize;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _OverlayTex;
uniform mediump sampler2D _AlphaTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_13;
float u_xlat14;
float u_xlat21;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_7 = texture(_AlphaTex, vs_TEXCOORD0.xy).w;
    u_xlat16_7 = u_xlat16_7 * vs_COLOR0.w;
    u_xlat14 = u_xlat16_7 * u_xlat0.x + -0.00100000005;
    u_xlat1.w = u_xlat0.x * u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat14<0.0);
#else
    u_xlatb0.x = u_xlat14<0.0;
#endif
    if(((int(u_xlatb0.x) * int(0xffffffffu)))!=0){discard;}
    u_xlat0 = vs_TEXCOORD3.xyxy * _MainTex_TexelSize.zwzw + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat2.zw = fract(u_xlat0.zw);
    u_xlat0 = u_xlat0 + (-u_xlat2.zwzw);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = (-u_xlat2.zw) + vec2(1.0, 1.0);
    u_xlat3 = u_xlat2.zwzy * vec4(1.0, 1.0, -1.0, 1.0) + vec4(0.0, 0.0, 1.0, 0.0);
    u_xlat4 = u_xlat2 * u_xlat3.zwxy;
    u_xlat4 = u_xlat3 * u_xlat4.zwxy;
    u_xlat5 = u_xlat4.zwxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.666666687, 0.666666687, 0.666666687, 0.666666687);
    u_xlat2 = (-u_xlat2) * u_xlat3.zwxy + u_xlat5;
    u_xlat2 = u_xlat4 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + u_xlat2;
    u_xlat3 = u_xlat4 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat3 = u_xlat3 / u_xlat2;
    u_xlat3 = u_xlat3 * vec4(1.0, 1.0, -1.0, -1.0) + vec4(1.0, 1.0, 0.0, 0.0);
    u_xlat3 = u_xlat3 * _MainTex_TexelSize.xyxy;
    u_xlat4 = u_xlat0.zwzw * _MainTex_TexelSize.xyxy + u_xlat3.xyzy;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.xyxy + u_xlat3.xwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat4.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat4.zw).xyz;
    u_xlat5 = u_xlat2.yyww * u_xlat2.xzxz;
    u_xlat4.xyz = u_xlat16_4.xyz * u_xlat5.yyy;
    u_xlat3.xyz = u_xlat5.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat3.xyz = u_xlat5.zzz * u_xlat16_4.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat5.www * u_xlat16_0.xyz + u_xlat3.xyz;
    u_xlat21 = u_xlat5.y + u_xlat5.x;
    u_xlat21 = u_xlat2.x * u_xlat2.w + u_xlat21;
    u_xlat21 = u_xlat2.z * u_xlat2.w + u_xlat21;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat21);
    u_xlat16_2 = texture(_OverlayTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_2 + _TextureSampleAdd;
    u_xlat16_6 = (-u_xlat16_2.w) + 1.0;
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_6) + u_xlat16_13.xyz;
    u_xlat21 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(u_xlat21);
    u_xlat1.xyz = vs_TEXCOORD2.xxx * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_2 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    vs_TEXCOORD2.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _MainTex_TexelSize;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _OverlayTex;
uniform mediump sampler2D _AlphaTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_13;
float u_xlat14;
float u_xlat21;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_7 = texture(_AlphaTex, vs_TEXCOORD0.xy).w;
    u_xlat16_7 = u_xlat16_7 * vs_COLOR0.w;
    u_xlat14 = u_xlat16_7 * u_xlat0.x + -0.00100000005;
    u_xlat1.w = u_xlat0.x * u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat14<0.0);
#else
    u_xlatb0.x = u_xlat14<0.0;
#endif
    if(((int(u_xlatb0.x) * int(0xffffffffu)))!=0){discard;}
    u_xlat0 = vs_TEXCOORD3.xyxy * _MainTex_TexelSize.zwzw + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat2.zw = fract(u_xlat0.zw);
    u_xlat0 = u_xlat0 + (-u_xlat2.zwzw);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = (-u_xlat2.zw) + vec2(1.0, 1.0);
    u_xlat3 = u_xlat2.zwzy * vec4(1.0, 1.0, -1.0, 1.0) + vec4(0.0, 0.0, 1.0, 0.0);
    u_xlat4 = u_xlat2 * u_xlat3.zwxy;
    u_xlat4 = u_xlat3 * u_xlat4.zwxy;
    u_xlat5 = u_xlat4.zwxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.666666687, 0.666666687, 0.666666687, 0.666666687);
    u_xlat2 = (-u_xlat2) * u_xlat3.zwxy + u_xlat5;
    u_xlat2 = u_xlat4 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + u_xlat2;
    u_xlat3 = u_xlat4 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat3 = u_xlat3 / u_xlat2;
    u_xlat3 = u_xlat3 * vec4(1.0, 1.0, -1.0, -1.0) + vec4(1.0, 1.0, 0.0, 0.0);
    u_xlat3 = u_xlat3 * _MainTex_TexelSize.xyxy;
    u_xlat4 = u_xlat0.zwzw * _MainTex_TexelSize.xyxy + u_xlat3.xyzy;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.xyxy + u_xlat3.xwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat4.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat4.zw).xyz;
    u_xlat5 = u_xlat2.yyww * u_xlat2.xzxz;
    u_xlat4.xyz = u_xlat16_4.xyz * u_xlat5.yyy;
    u_xlat3.xyz = u_xlat5.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat3.xyz = u_xlat5.zzz * u_xlat16_4.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat5.www * u_xlat16_0.xyz + u_xlat3.xyz;
    u_xlat21 = u_xlat5.y + u_xlat5.x;
    u_xlat21 = u_xlat2.x * u_xlat2.w + u_xlat21;
    u_xlat21 = u_xlat2.z * u_xlat2.w + u_xlat21;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat21);
    u_xlat16_2 = texture(_OverlayTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_2 + _TextureSampleAdd;
    u_xlat16_6 = (-u_xlat16_2.w) + 1.0;
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_6) + u_xlat16_13.xyz;
    u_xlat21 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(u_xlat21);
    u_xlat1.xyz = vs_TEXCOORD2.xxx * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "gles hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
}
}
}
}