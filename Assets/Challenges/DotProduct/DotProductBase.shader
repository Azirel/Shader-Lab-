Shader "Azirel/Rim"
{

	Properties
	{
		 _AlbedoTexture("Albedo", 2D) = "black"{}
		 _RimColor("Rim Colour", Color) = (1,1,1,1)
		 _RimPower("Rim power", Range(0,10)) = 2.0
		 _Normal("Example Normal", 2D) = "black"{}
		 _EmissionReflection("Example Emission", CUBE) = "black"{}
		 _StipFactor("Stip width", Range(0,100)) = 2.0
	}

		SubShader
		 {
			 Tags {"Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Transparent" "LightMode"="Always"}
			 CGPROGRAM
				 #pragma surface surf Lambert

				 struct Input
				 {
					 float2 uv_AlbedoTexture;
					 float3 worldRefl; INTERNAL_DATA
					 float3 viewDir;
					 float3 worldPos;
				 };

				 fixed4 _RimColor;
				 half _RimPower;
				 half _StipFactor;
				 sampler2D _AlbedoTexture;
				 sampler2D _Normal;
				 samplerCUBE _EmissionReflection;

				 void surf(Input IN, inout SurfaceOutput o)
				 {
					 //o.Albedo = tex2D(_AlbedoTexture, IN.uv_AlbedoTexture);
					 //o.Normal = UnpackNormal(tex2D(_Normal, IN.uv_AlbedoTexture));
					 //o.Emission = texCUBE(_Emission, WorldReflectionVector(IN, o.Normal)).rgb;
					 half rim = 1 - pow(saturate(dot(normalize(IN.viewDir), o.Normal)),_RimPower);
					 //o.Emission = _RimColor.rgb * pow(rim, _RimPower) * texCUBE(_EmissionReflection, WorldReflectionVector(IN, o.Normal)).rgb;
					 /*o.Emission = frac(IN.worldPos.y * _StipFactor) > 0.5 ? float3(0, 1, 0) * rim : float3(1, 0, 0) * rim;*/
					 o.Albedo = rim * 0.9;
				 }

			 ENDCG
		 }
			 FallBack "Diffuse"
}