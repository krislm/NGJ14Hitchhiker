        // Upgrade NOTE: replaced 'SeperateSpecular' with 'SeparateSpecular'
    Shader "Mobile/EnvMapGlass1"
    {
     
     Properties
     {
     	_Color ("Color", Color ) = (1,1,1,1)
        _EnvMap ("EnvMap", 2D) = "black" { TexGen SphereMap }
     }
     
     SubShader
     {
         SeparateSpecular On
         Tags {"Queue" = "Transparent" }
     
          Pass
          {
             Name "BASE"
             ZWrite on
             //Blend One One                       // additive
             //Blend One OneMinusSrcColor          // soft additive
             Blend SrcAlpha OneMinusSrcAlpha     // real alpha blending
             BindChannels
             {
              Bind "Vertex", vertex
              Bind "normal", normal
            }
     
           SetTexture [_EnvMap]
           {
              combine texture
           }
           SetTexture [_Dummy]
           {
           constantColor[_Color]
           combine constant-previous
           }
          }
       }
    }