# Memristive Silicon Oxide Devices for Biorealistic Learning

[![License MIT](http://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE.txt)

This repository contains the LaTeX source code and figures for the PhD dissertation of **Viet Cuong Vu**, submitted in fulfilment of the requirements for the degree of Doctor of Philosophy at University College London (UCL), Department of Electronics and Electrical Engineering.

## Abstract

This thesis develops biorealistic learning on memristive silicon-oxide devices, arguing that the slow current transient of the subthreshold regime, usually dismissed as a device imperfection, is instead a computational resource for spiking neural networks (SNNs). From the measured transients it builds a SPICE-compatible compact model and a hardware-aware training framework, sampling the devices' Poole–Frenkel conductance statistics into surrogate-gradient training of simulated memristive SNNs. How the transient should be treated depends on the architecture: a homeostatic regulariser that suppresses it aids fully connected networks but reverses to a cost once the network is temporal, whereas as the leak of a leaky integrate-and-fire membrane its retention becomes a fabrication-set memory that clears recognised neuromorphic benchmarks.

Its final contribution recasts the transient as a learning primitive. The trap-cascade dynamics reduce to the canonical eligibility-trace equation, so the trap-discharge retention becomes a programmable credit-assignment window for reward-modulated reinforcement learning. On this basis the device trace assigns distal-reward credit, closes a contextual spiking bandit, and learns a cue-conditioned T-maze policy, matching the established R-STDP and e-prop traces; the trap-filling rise further makes it interval-selective rather than recency-weighted.

Paired with a per-neuron feedback-alignment signal, the trace carries credit through a deep two-layer network with no weight transport, reusing the same homeostatic mechanism that stabilised static inference to keep this all-local learner reliable, so a single material supplies both of biology's slow local learning primitives. The rule grounds in dopamine two ways: it reproduces the human positive- versus negative-feedback asymmetry on the Frank task, and the full stack learns under a reward decoded from a directly measured dopamine transient. Across every task the maximum learnable delay scales with retention, a physically grounded relation that doubles as a fabrication design rule. The wider claim is that learning rules need not merely be implemented in hardware but can emerge from the intrinsic dynamics of matter.

## Repository Structure

- `Abstract/`, `Acknowledgement/`, `Declaration/`: Frontmatter components
- `Chapter1/` to `Chapter8/`: Core thesis chapters and corresponding figures
- `Classes/` and `sty/`: LaTeX class definitions and styling
- `References/`: Bibliography data
- `thesis.tex`: Main document entry point
- `compile-thesis.sh`: Helper scripts for build processes

## Building the Thesis

The document is built using `latexmk`. To compile the thesis locally and generate `thesis.pdf`, run the following in the repository root:

```bash
latexmk -pdf thesis.tex
```

Alternatively, you can use the provided shell script for different build targets:

```bash
./compile-thesis.sh compile    # Default full compilation
./compile-thesis.sh draft      # Fast draft pass (skips figure embedding)
./compile-thesis.sh cleanall   # Removes auxiliary build files and output PDF
```

## Citation

If you reference this work or use the materials provided here, please cite the dissertation as follows:

```bibtex
@phdthesis{vu2026memristive,
  author  = {Viet Cuong Vu},
  title   = {Memristive Silicon Oxide Devices for Biorealistic Learning},
  school  = {University College London},
  year    = {2026}
}
```

## License

The content of this thesis and the associated code are provided under the MIT License. See `LICENSE.txt` for more details.
