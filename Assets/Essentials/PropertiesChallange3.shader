Shader "Azirel/HelloShaderGAlways1"
{
	
	Properties
	{
		 _AlbedoTexture ("Albedo", 2D) = "black"{}
		 _GreenMultiplier ("Green multiplier", Range (0, 10)) = 1
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
			fixed _GreenMultiplier;

			void surf (Input IN, inout SurfaceOutput o)
			{
			    o.Albedo = tex2D(_AlbedoTexture, IN.uv_AlbedoTexture);
				o.Albedo.g *= _GreenMultiplier;
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}