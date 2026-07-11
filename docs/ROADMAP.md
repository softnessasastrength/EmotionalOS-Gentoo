# Roadmap

## Phase 0 — Define the target

- Record project principles.
- Capture sanitized hardware inventory from the X1 Carbon Gen 3.
- Decide the Gentoo profile, init system, desktop environment, filesystem, bootloader, and update policy.
- Define what is inherited from EmotionalOS and what is Gentoo-specific.

Exit condition: major choices are documented with rationale and the actual hardware is known.

## Phase 1 — Reproducible root filesystem

- Pin or record the stage3 source.
- Apply repository-owned Portage configuration.
- Install the initial package set.
- Configure users, locales, networking, logging, and security defaults.
- Produce binary packages for repeat builds.

Exit condition: a clean build environment can produce the same usable root filesystem without undocumented manual edits.

## Phase 2 — Bootable virtual image

- Install kernel, initramfs, microcode, firmware, and bootloader.
- Assemble a disk image or live ISO.
- Boot-test under QEMU using UEFI firmware.
- Capture serial-console output and retain failure logs.

Exit condition: CI can build an artifact and demonstrate that it reaches a defined boot milestone.

## Phase 3 — X1 Carbon Gen 3 enablement

- Install on the physical reference laptop.
- Validate graphics, input, wireless, Bluetooth, audio, webcam, hotkeys, suspend, battery behavior, USB, and external display output.
- Record all hardware exceptions and required firmware.
- Maintain a known-good recovery image and kernel.

Exit condition: the hardware checklist passes or every remaining limitation is explicitly accepted.

## Phase 4 — EmotionalOS experience

- Apply desktop, accessibility, visual, workflow, and application defaults.
- Separate philosophy-driven defaults from hardware workarounds.
- Add first-boot behavior and documentation.
- Validate that the system remains understandable and reversible.

Exit condition: the system is recognizably EmotionalOS rather than merely Gentoo on a ThinkPad.

## Phase 5 — Release engineering

- Generate checksums and provenance metadata.
- Sign release artifacts.
- Publish installation and recovery documentation.
- Run clean-build and hardware regression tests.
- Define support boundaries and known issues.

Exit condition: another technically capable person can reproduce, install, verify, and recover the system using the repository documentation.
