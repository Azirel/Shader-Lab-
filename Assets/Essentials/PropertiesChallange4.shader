Shader "Azirel/HelloShader"
{
	
	Properties
	{
		 _AlbedoTexture ("Albedo", 2D) = "black"{}
	     _EmissionTexture ("Emission", 2D) = "black"{}
	}
	
	SubShader
	{
		
		CGPROGRAM
			#pragma surface surf Lambert

			struct Input
			{
				float2 uv_AlbedoTexture;
				float2 uv_EmissionTexture;
			};

			sampler2D _AlbedoTexture;
			sampler2D _EmissionTexture;

			void surf (Input IN, inout SurfaceOutput o)
			{
			    o.Albedo = tex2D(_AlbedoTexture, IN.uv_AlbedoTexture);
			    o.Emission = tex2D(_EmissionTexture, IN.uv_EmissionTexture);
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}