# DC2_FABRIC

## Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| DC2_FABRIC | l3leaf | DC2-BL1 | 10.88.169.141/24 | cEOS | Provisioned | - |
| DC2_FABRIC | l3leaf | DC2-BL2 | 10.88.169.142/24 | cEOS | Provisioned | - |
| DC2_FABRIC | l3leaf | DC2-CL1 | 10.88.169.143/24 | cEOS | Provisioned | - |
| DC2_FABRIC | l3leaf | DC2-CL2 | 10.88.169.144/24 | cEOS | Provisioned | - |
| DC2_FABRIC | l3leaf | DC2-CL3 | 10.88.169.145/24 | cEOS | Provisioned | - |
| DC2_FABRIC | l3leaf | DC2-CL4 | 10.88.169.146/24 | cEOS | Provisioned | - |
| DC2_FABRIC | spine | DC2-SP1 | 10.88.169.139/24 | cEOS | Provisioned | - |
| DC2_FABRIC | spine | DC2-SP2 | 10.88.169.140/24 | cEOS | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | DC2-BL1 | Ethernet1 | spine | DC2-SP1 | Ethernet5 |
| l3leaf | DC2-BL1 | Ethernet2 | spine | DC2-SP2 | Ethernet5 |
| l3leaf | DC2-BL1 | Ethernet8 | mlag_peer | DC2-BL2 | Ethernet8 |
| l3leaf | DC2-BL2 | Ethernet1 | spine | DC2-SP1 | Ethernet6 |
| l3leaf | DC2-BL2 | Ethernet2 | spine | DC2-SP2 | Ethernet6 |
| l3leaf | DC2-CL1 | Ethernet1 | spine | DC2-SP1 | Ethernet1 |
| l3leaf | DC2-CL1 | Ethernet2 | spine | DC2-SP2 | Ethernet1 |
| l3leaf | DC2-CL1 | Ethernet8 | mlag_peer | DC2-CL2 | Ethernet8 |
| l3leaf | DC2-CL2 | Ethernet1 | spine | DC2-SP1 | Ethernet2 |
| l3leaf | DC2-CL2 | Ethernet2 | spine | DC2-SP2 | Ethernet2 |
| l3leaf | DC2-CL3 | Ethernet1 | spine | DC2-SP1 | Ethernet3 |
| l3leaf | DC2-CL3 | Ethernet2 | spine | DC2-SP2 | Ethernet3 |
| l3leaf | DC2-CL3 | Ethernet8 | mlag_peer | DC2-CL4 | Ethernet8 |
| l3leaf | DC2-CL4 | Ethernet1 | spine | DC2-SP1 | Ethernet4 |
| l3leaf | DC2-CL4 | Ethernet2 | spine | DC2-SP2 | Ethernet4 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 172.16.2.0/24 | 256 | 24 | 9.38 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| DC2-BL1 | Ethernet1 | 172.16.2.17/31 | DC2-SP1 | Ethernet5 | 172.16.2.16/31 |
| DC2-BL1 | Ethernet2 | 172.16.2.19/31 | DC2-SP2 | Ethernet5 | 172.16.2.18/31 |
| DC2-BL2 | Ethernet1 | 172.16.2.21/31 | DC2-SP1 | Ethernet6 | 172.16.2.20/31 |
| DC2-BL2 | Ethernet2 | 172.16.2.23/31 | DC2-SP2 | Ethernet6 | 172.16.2.22/31 |
| DC2-CL1 | Ethernet1 | 172.16.2.1/31 | DC2-SP1 | Ethernet1 | 172.16.2.0/31 |
| DC2-CL1 | Ethernet2 | 172.16.2.3/31 | DC2-SP2 | Ethernet1 | 172.16.2.2/31 |
| DC2-CL2 | Ethernet1 | 172.16.2.5/31 | DC2-SP1 | Ethernet2 | 172.16.2.4/31 |
| DC2-CL2 | Ethernet2 | 172.16.2.7/31 | DC2-SP2 | Ethernet2 | 172.16.2.6/31 |
| DC2-CL3 | Ethernet1 | 172.16.2.9/31 | DC2-SP1 | Ethernet3 | 172.16.2.8/31 |
| DC2-CL3 | Ethernet2 | 172.16.2.11/31 | DC2-SP2 | Ethernet3 | 172.16.2.10/31 |
| DC2-CL4 | Ethernet1 | 172.16.2.13/31 | DC2-SP1 | Ethernet4 | 172.16.2.12/31 |
| DC2-CL4 | Ethernet2 | 172.16.2.15/31 | DC2-SP2 | Ethernet4 | 172.16.2.14/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 10.250.2.0/24 | 256 | 8 | 3.13 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| DC2_FABRIC | DC2-BL1 | 10.250.2.7/32 |
| DC2_FABRIC | DC2-BL2 | 10.250.2.8/32 |
| DC2_FABRIC | DC2-CL1 | 10.250.2.3/32 |
| DC2_FABRIC | DC2-CL2 | 10.250.2.4/32 |
| DC2_FABRIC | DC2-CL3 | 10.250.2.5/32 |
| DC2_FABRIC | DC2-CL4 | 10.250.2.6/32 |
| DC2_FABRIC | DC2-SP1 | 10.250.2.1/32 |
| DC2_FABRIC | DC2-SP2 | 10.250.2.2/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 10.255.2.0/24 | 256 | 6 | 2.35 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| DC2_FABRIC | DC2-BL1 | 10.255.2.7/32 |
| DC2_FABRIC | DC2-BL2 | 10.255.2.7/32 |
| DC2_FABRIC | DC2-CL1 | 10.255.2.3/32 |
| DC2_FABRIC | DC2-CL2 | 10.255.2.3/32 |
| DC2_FABRIC | DC2-CL3 | 10.255.2.5/32 |
| DC2_FABRIC | DC2-CL4 | 10.255.2.5/32 |
