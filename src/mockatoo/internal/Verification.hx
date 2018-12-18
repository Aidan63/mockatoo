package mockatoo.internal;

import mockatoo.Mockatoo;

/**
	Dynamic class that is created for verification.
	Each dynamic method calls to a specific MockMethod.
*/
abstract Verification(VerificationMode) from Dynamic to Dynamic
{
	public function new(mode:VerificationMode)
	{
		this.mode = mode;	
	}
}
