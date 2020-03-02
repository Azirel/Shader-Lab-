Shader "Azirel/Lighing_Challenge2_CustomLight"
{
	Properties
	{
			_AlbedoTex("Albedo", 2D) = "black" {}
			_MetallicTex("Metallic (R)", 2D) = "white" {}
			_Metallic("Metallic", Range(0.0, 1.0)) = 0.0
			_Emiss("Emission", Range(0.0, 10.0)) = 1.0
			_LightSmotthness("Light smotthness", Range(1.0, 100.0)) = 1.0
			_Normal("Normal", 2D) = "white" {}
	}
		SubShader{
			Tags{
				"Queue" = "Geometry"
			}

			CGPROGRAM
			#pragma surface surf Toon

			sampler2D _MetallicTex;
			sampler2D _Normal;
			sampler2D _AlbedoTex;
			half _Metallic;
			half _Emiss;
			half _LightSmotthness;

			struct Input
			{
				float2 uv_MetallicTex;
				float2 uv_Normal;
			};

			half4 LightingToon(SurfaceOutput output, half3 lightDir, fixed attenuation)
			{
				half strenght = dot(output.Normal, lightDir);
				half4 lightMultiplier = saturate(((floor(strenght * 10) % floor(_LightSmotthness))) * attenuation * _LightColor0) * _Emiss;
				return half4(output.Albedo, 1) * lightMultiplier;
			}

			void surf(Input IN, inout SurfaceOutput o)
			{
				o.Albedo = tex2D(_AlbedoTex, IN.uv_MetallicTex);
				o.Normal = UnpackNormal(tex2D(_Normal, IN.uv_Normal));
				/*o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex).r;
				o.Metallic = _Metallic;
				o.Emission = tex2D(_MetallicTex, IN.uv_MetallicTex).r * _Emiss;*/
			}
			ENDCG
			}
				FallBack "Diffuse"

}
