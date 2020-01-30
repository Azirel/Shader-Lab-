Shader "Azirel/PropertiesChallange2"
{
	
	Properties
	{
		 _AlbedoTexture ("Albedo", 2D) = "black"{}
	}
	
	SubShader
	{
		
		CGPROGRAM
			#pragma surface surf Lambert

			struct Input
			{
				float2 uv_AlbedoTexture;
			};

			sampler2D _AlbedoTexture;

			void surf (Input IN, inout SurfaceOutput o)
			{
			    o.Albedo = tex2D(_AlbedoTexture, IN.uv_AlbedoTexture);
				o.Albedo.g = 1;
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}