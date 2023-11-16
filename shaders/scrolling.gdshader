shader_type canvas_item;

uniform float speed = 10.0;

void vertex() {
	// VERTEX
	// TIME
	VERTEX += vec2(mod(TIME, 10.0) * speed, VERTEX.y);
}
