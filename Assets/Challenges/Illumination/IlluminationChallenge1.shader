Shader "Azirel/IlliminationChallenge1"
{
	
	Properties
	{
		 _AlbedoTexture ("Albedo", 2D) = "black"{}
	     _Colour ("Example Colour", Color) = (1,1,1,1)
	     _Normal ("Example Normal", Color) = (1,1,1,1)
	     _Emission ("Example Emission", Color) = (1,1,1,1)
		 _EmissionStrenght("Emission strenght", Range(0,1)) = 1
	}
	
	SubShader
	{
		
		CGPROGRAM
			#pragma surface surf Lambert

			struct Input
			{
				float2 uv_AlbedoTexture;
			};

			fixed4 _Colour;
			fixed4 _Emission;
			fixed4 _Normal;
			fixed _EmissionStrenght;

			sampler2D _AlbedoTexture;

			void surf (Input IN, inout SurfaceOutput o)
			{
			    o.Albedo = tex2D(_AlbedoTexture, IN.uv_AlbedoTexture)*_Colour.rgb;
			    o.Emission = _Emission.rgb * _EmissionStrenght;
			    o.Normal = _Normal;
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}