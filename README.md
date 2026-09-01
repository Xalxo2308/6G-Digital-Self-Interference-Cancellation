# Digital Self-Interference Cancellation for 6G Full-Duplex Communication

## Overview

This project investigates digital self-interference cancellation (SIC) for in-band full-duplex communication systems, with a focus on next-generation 6G wireless networks.

In-band full-duplex communication allows a wireless device to transmit and receive simultaneously on the same frequency band. However, the transmitted signal can create strong self-interference at the receiver, significantly affecting communication performance.

This project investigates adaptive digital cancellation techniques for reducing self-interference and compares the performance of two optimisation approaches:

- Least Mean Squares (LMS)
- Steepest Descent (SD)

MATLAB was used for system modelling, simulation, algorithm implementation and performance analysis.

---

## Project Objectives

The main objectives of the project were to:

- Investigate the self-interference problem in in-band full-duplex communication.
- Model digital self-interference cancellation using MATLAB.
- Implement LMS and Steepest Descent algorithms.
- Evaluate channel estimation performance.
- Compare the convergence and error performance of the two approaches.
- Analyse the suitability of adaptive cancellation techniques for future 6G communication systems.

---

## System Concept

A simplified representation of the digital self-interference cancellation process is:

```text
Transmitted Signal
        |
        v
Self-Interference Channel
        |
        v
Received Signal
        |
        v
Channel Estimation
        |
        +----------------------+
        |                      |
        v                      v
       LMS              Steepest Descent
        |                      |
        +----------+-----------+
                   |
                   v
        Self-Interference
           Cancellation
                   |
                   v
        Performance Analysis



### One important change before you paste it

I would **not leave the README claiming anything that isn't actually represented by the files in the repository**. In particular, check that these two image paths actually exist:

```text
Results/channel_estimation_error.png
Results/performance_comparison.png
