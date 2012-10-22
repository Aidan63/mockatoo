package mockatoo.internal;
import mockatoo.exception.VerificationException;
import mockatoo.Mockatoo;
class MethodProxy
{
	public var fieldName(default, null):String;
	
	/**
	Number of arguments 
	*/
	public var argCount(default, null):Int;

	var argumentTypes:Array<String>;

	var returnType:Null<String>;

	var className:String;

	public var count(default, null):Int;

	public function new(className:String, fieldName:String, arguments:Array<String>, ?returns:String)
	{
		this.fieldName = fieldName;
		this.className = className;

		argumentTypes = arguments;
		returnType = returns;

		argCount = argumentTypes.length;
		count = 0;

		// for(arg in arguments)
		// {
		// 	try
		// 	{
		// 		var classType = Type.resolveClass(arg);

		// 		if(classType != null)
		// 		{

		// 			var enumType = Type.resolveEnum(arg);
		// 		}
		// 	}

		// }
	}

	public function call(args:Array<Dynamic>)
	{
		count ++;
	}

	public function callAndReturn<T>(args:Array<Dynamic>, ret:T):T
	{
		count ++;
		return ret;
	}

	public function verify(filter:VerificationFilter, ?args:Array<Dynamic>):Bool
	{
		trace(fieldName + ":" + Std.string(filter) + ": " + Std.string(args) + ", " + count);
		switch(filter)
		{
			case times(value):
				if(count == value) return true;
			case atLeastOnce:
				if(count > 0) return true;
			case never:
				if(count == 0) return true;
			case atLeast(value):
				if(count >= value) return true;
		}

		throw new VerificationException(className + "." + fieldName + " was not invoked.");

		return false;
	}
}