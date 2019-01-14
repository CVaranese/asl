state("skating")
{
    //bool isLoading : 0x56A08, 0x4CC;
    bool isLoading : "skating.exe", 0x03AB7C, 0x18;
    byte menuScreen : 0x378A8, 0x5;
    byte grabbedKey : 0x8EC61; //1 when grabbed the key, 0 when didn't
}

startup
{
    Action<string> DebugOutput = (text) => {
        print("[GOOF] "+text);
    };
    vars.DebugOutput = DebugOutput;
    vars.WorldSelect = 48;
    vars.DebugOutput("startup");

}

isLoading
{
	if(current.isLoading){
		print("load");
	}
    return (current.isLoading);
}

split
{
    if (!old.isLoading && current.isLoading && old.menuScreen != vars.WorldSelect && current.grabbedKey == 1){
        return true;
    }
    else {
        return false;
    }
}

start
{
    if (old.menuScreen == vars.WorldSelect
        && current.isLoading
        && !old.isLoading){

        return true;
    }
    else {
        return false;
    }
}

shutdown
{
}