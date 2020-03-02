Shader "Azirel/IlluminationBase2"
{
	
	Properties
	{
		 _AlbedoTexture ("Albedo", 2D) = "black"{}
	     _Colour ("Example Colour", Color) = (1,1,1,1)
		 _Normal("Example Normal", 2D) = "black"{}
	     _Emission ("Example Emission", CUBE) = "black"{}
	}
	
	SubShader
	{
		
		CGPROGRAM
			#pragma surface surf Lambert

			struct Input
			{
				float2 uv_AlbedoTexture;
				float3 worldRefl; INTERNAL_DATA
			};

			fixed4 _Colour;
			sampler2D _AlbedoTexture;
			sampler2D _Normal;
			samplerCUBE _Emission;

			void surf (Input IN, inout SurfaceOutput o)
			{
			    o.Albedo = tex2D(_AlbedoTexture, IN.uv_AlbedoTexture)*_Colour.rgb;
				o.Normal = UnpackNormal(tex2D(_Normal, IN.uv_AlbedoTexture));
				o.Emission = texCUBE(_Emission, WorldReflectionVector(IN, o.Normal)).rgb;
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}