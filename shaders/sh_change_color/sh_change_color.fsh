// The fragment shader

varying vec2 v_vTexcoord;  // Texture coordinates
varying vec4 v_vColour;    // Vertex color

uniform vec3 u_replaceColor;  // The color to replace red with

void main() {
    vec4 color = texture2D(gm_BaseTexture, v_vTexcoord); // Get the color of the current pixel

    // Check if red is the dominant color
    if (color.r > color.g && color.r > color.b) {
        // Replace the red component with the provided color
        color.rgb = u_replaceColor * color.r;
    }

    gl_FragColor = color * v_vColour;  // Apply the vertex color and output the final color
}
