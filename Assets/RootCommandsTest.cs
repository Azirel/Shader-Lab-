using NGTools.NGGameConsole;
using UnityEngine;

public class RootCommandsTest : MonoBehaviour
{
	[CommandAttribute("TestCommand", "")]
	public string TestCommand()
	{
		print("TestInvoked");
		return string.Empty;
	}
}
