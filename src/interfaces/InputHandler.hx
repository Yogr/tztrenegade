package interfaces;

import enums.GameDefs;

/**
 * ...
 * @author Yogr
 */

interface InputHandler 
{
    //-----------------------------------------------------------------------------------
    /// Function declaration. Implementation is up to the classes who use it.
    public function HandleInput(value:InputCode):Bool;
}