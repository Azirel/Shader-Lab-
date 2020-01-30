Shader "Azirel/PropertiesChallange1"
{
	
	Properties
	{
		 _AlbedoTexture ("Albedo", 2D) = "black"{}
	     _Color ("Example Colour", Color) = (1,1,1,1)
	     _ColorMultiplier ("Green multiplier", Range (0, 10)) = 1
	}
	
	SubShader
	{
		
		CGPROGRAM
			#pragma surface surf Lambert

			struct Input
			{
				float2 uv_AlbedoTexture;
			};

			fixed4 _Color;
			fixed _ColorMultiplier;
			sampler2D _AlbedoTexture;

			void surf (Input IN, inout SurfaceOutput o)
			{
			    o.Albedo = tex2D(_AlbedoTexture, IN.uv_AlbedoTexture)*_Color.rgb*_ColorMultiplier;
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}