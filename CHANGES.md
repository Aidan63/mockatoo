v1.0.x
- added mocking for typedef structures (no verify/stubbing though)
- changed mock param type in verify to Dynamic (avoids casting)
- added Mockatoo.reset(mock) to reset stubs/verifications
- fixed issue #6 - super class typed params inside of typed params not mapped correctly
