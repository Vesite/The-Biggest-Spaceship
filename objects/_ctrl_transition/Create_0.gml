
// Make the object a Singleton
if (assign_singleton() == false)	exit

enum TRANSITION_MODE 
{
	OFF,		// When there is no transition effect on screen
	GOTO,		// Transition "out" to a room we choose
	INTRO,		// If we are here the fading goes from black to nothing (fading "in")
}
	
transition_mode = TRANSITION_MODE.INTRO // Start the game fading "in"
percent = 1								// Will always be between 1 and 0
target_room = room						// The target_room room we are transitioning too
trans_spd = 40							// Takes this many frames to transition in one direction
