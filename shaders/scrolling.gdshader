shader_type canvas_item;

uniform float speed;
uniform vec4 color: source_color;

void fragment() {
	COLOR = texture(TEXTURE, vec2(UV.x + TIME * speed, UV.y)) * color;
}
