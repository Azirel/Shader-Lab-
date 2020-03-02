Shader "Azirel/IlluminationChallenge3"
{
	
	Properties
	{
		 _AlbedoTexture ("Albedo", 2D) = "black"{}
	     _Colour ("Example Colour", Color) = (1,1,1,1)
	     _Normal ("Example Normal", 2D) = "black"{}
	     _Emission ("Example Emission", Color) = (1,1,1,1)
		 _CubeMap("Cube map for reflections", CUBE) = "white"{}
	}
	
	SubShader
	{
		
		CGPROGRAM
			#pragma surface surf Lambert

			struct Input
			{
				float2 uv_AlbedoTexture;
				float2 uv_Normal;
				float3 worldRefl; INTERNAL_DATA
			};

			fixed4 _Colour;
			fixed4 _Emission;
			sampler2D _Normal;
			sampler2D _AlbedoTexture;
			samplerCUBE _CubeMap;

			void surf (Input IN, inout SurfaceOutput o)
			{
			    o.Albedo = tex2D(_AlbedoTexture, IN.uv_AlbedoTexture)* texCUBE(_CubeMap, IN.worldRefl).rgb;
				//o.Albedo = texCUBE(_CubeMap, IN.worldRefl).rgb;
			    //o.Emission = _Emission.rgb;
				o.Normal = UnpackNormal(tex2D(_Normal, IN.uv_Normal));
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}