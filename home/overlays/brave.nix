self: super: {
  brave = super.brave.overrideAttrs (old: {
    # Disable CPU detection and force a safe baseline
    NIX_CFLAGS_COMPILE = (old.NIX_CFLAGS_COMPILE or []) ++ [
      "-march=x86-64-v2"
      "-mtune=generic"
      "-mno-avx2"
      "-mno-avx512f"
      "-mno-avx512bw"
      "-mno-avx512vl"
    ];

    CFLAGS = [
      "-march=x86-64-v2"
      "-mtune=generic"
      "-mno-avx2"
    ];

    CXXFLAGS = [
      "-march=x86-64-v2"
      "-mtune=generic"
      "-mno-avx2"
    ];

    dontStrip = true;
  });
}

