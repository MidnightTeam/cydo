## Cydo [Depreciated]

This *was* the custom cydo bundled with the (internal betas of the) Meridian Jailbreak.

It is no longer needed as SUID is possible to achieve without any calls to Jailbreakd.

This will be left to serve as an example on *how* to call to Jailbreak, using libjailbreak.

Note: please don't use the 'setuid' calls, they will be depreciated soon. You can simply set sticky bit (chmod +s target) and call setuid(0) to achieve uid0.

Refer to the libjailbreak headers here [here](https://github.com/MidnightTeam/libjailbreak/blob/master/libjailbreak.h) for full API usage.
