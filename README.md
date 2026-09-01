# Digital Self-Interference Cancellation for 6G Full-Duplex Communication

## Overview

This project investigates **digital self-interference (SI) cancellation** for **in-band full-duplex (IBFD) communication systems** targeting future 6G networks.

In full-duplex communication, transmission and reception occur simultaneously on the same frequency band. This creates a strong self-interference signal at the receiver, which can significantly degrade communication performance.

The project focuses on the use of **adaptive digital cancellation algorithms**, particularly:

- Least Mean Squares (LMS)
- Steepest Descent (SD)

MATLAB-based simulations were used to model, evaluate and compare the performance of the cancellation approaches.

---

## Objectives

The main objectives of this project were to:

1. Investigate the self-interference problem in in-band full-duplex communication.
2. Develop a MATLAB-based digital self-interference cancellation model.
3. Implement and evaluate LMS and Steepest Descent algorithms.
4. Compare channel estimation performance across different numbers of iterations.
5. Analyse communication performance using Bit Error Rate (BER).
6. Investigate BER performance across different Signal-to-Noise Ratio (SNR) conditions.
7. Evaluate the suitability of adaptive digital cancellation for future 6G communication systems.

---

## System Concept

The overall digital self-interference cancellation process can be represented as:

**Transmitter → Full-Duplex Channel → Receiver → SI Estimation → Digital Cancellation → Desired Signal**

The received signal contains both the desired signal and residual self-interference. An adaptive digital cancellation algorithm estimates the interference component and subtracts it from the received signal.

---

## System Flowchart

![Digital SIC System Flowchart](results/Digital_SIC_System_Flowchart.png)

---

## Methodology

### 1. Self-Interference Modelling

A full-duplex communication scenario was modelled in MATLAB to represent the interference introduced by simultaneous transmission and reception.

The received signal consists of the desired communication signal together with self-interference and noise.

### 2. LMS Adaptive Filtering

The **Least Mean Squares (LMS)** algorithm was investigated as an adaptive approach for estimating the self-interference channel.

LMS iteratively updates the filter coefficients based on the estimation error.

The general update relationship is:

\[
w(n+1) = w(n) + \mu e(n)x(n)
\]

where:

- `w(n)` = adaptive filter coefficient
- `μ` = step size
- `e(n)` = estimation error
- `x(n)` = input signal

### 3. Steepest Descent

The **Steepest Descent (SD)** algorithm was also evaluated for channel estimation.

The algorithm updates the filter coefficients in the direction that reduces the mean-square error.

### 4. Performance Evaluation

The algorithms were evaluated using:

- Channel estimation error
- BER
- Number of iterations
- SNR

This allowed the behaviour of the two adaptive approaches to be compared under different simulation conditions.

---

## Results

### Channel Estimation Error

The channel estimation error was evaluated across different iteration counts.

![LMS vs SD Channel Estimation Error](results/LMS_vs_SD_Channel_Estimation_Error.png)

The simulation results show the convergence behaviour of the LMS and Steepest Descent approaches.

---

### BER vs Iterations

BER performance was also evaluated as the number of adaptive iterations increased.

![LMS vs SD BER vs Iterations](results/LMS_vs_SD_BER_vs_Iterations.png)

This analysis provides an indication of how iterative adaptation affects communication performance.

---

### BER vs SNR

The relationship between BER and SNR was investigated to assess communication performance under different signal-to-noise conditions.

![LMS vs SD BER vs SNR](results/LMS_vs_SD_BER_vs_SNR.png)

---

### OFDM Performance

An OFDM-based communication scenario was also investigated to examine BER performance in a multicarrier communication system.

![OFDM BER Performance](results/OFDM_BER_Performance.png)

---

## Key Findings

The simulation-based investigation indicates that adaptive digital signal processing can be used to estimate and mitigate self-interference in full-duplex communication systems.

The comparison of LMS and Steepest Descent considered:

- Convergence behaviour
- Channel estimation error
- BER performance
- Iteration count
- SNR conditions

The results provide practical insight into the trade-offs involved in selecting adaptive cancellation algorithms for digital self-interference mitigation.

---

## Engineering Skills Demonstrated

This project demonstrates practical experience in:

- MATLAB
- Digital signal processing
- Wireless communications
- Full-duplex communication systems
- OFDM
- MIMO communication concepts
- Adaptive filtering
- Channel estimation
- BER and SNR analysis
- System modelling
- Simulation and verification
- Engineering data analysis
- Technical documentation
- Problem solving

---

## Relevance to Communications and Systems Engineering

The project involved taking a communication-system problem, developing a mathematical and simulation-based model, implementing alternative engineering approaches, and evaluating their performance using measurable system-level metrics.

The methodology is relevant to engineering environments involving:

- Telecommunications infrastructure
- Wireless communication systems
- Signal processing
- Systems engineering
- Network performance analysis
- Engineering verification and testing

---

## Tools

| Tool | Application |
|---|---|
| MATLAB | System modelling and simulation |
| MATLAB Signal Processing | Communication and signal analysis |
| OFDM | Multicarrier communication modelling |
| Adaptive Algorithms | Self-interference estimation and cancellation |
| GitHub | Version control and project documentation |

---

## Project Structure

```text
6G-Digital-Self-Interference-Cancellation/
│
├── README.md
│
├── MATLAB/
│   ├── LMS_Estimate.m
│   ├── SteepestDescent.m
│   └── main_simulation.m
│
├── results/
│   ├── LMS_vs_SD_Channel_Estimation_Error.png
│   ├── LMS_vs_SD_BER_vs_Iterations.png
│   ├── LMS_vs_SD_BER_vs_SNR.png
│   ├── OFDM_BER_Performance.png
│   └── Digital_SIC_System_Flowchart.png
│
└── report/
