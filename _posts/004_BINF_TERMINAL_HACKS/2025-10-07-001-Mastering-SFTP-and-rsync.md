---
date: 2025-10-07 12:29:19
layout: post
title: Mastering SFTP and rsync for Bioinformatics Data Transfers
subtitle: Secure, fast, and efficient file transfers for HPC clusters and research servers
description: Learn how to handle secure file transfers in bioinformatics workflows, including SFTP with legacy host key support, rsync for speedy downloads/uploads, and critical security tips for HPC environments.


series: Bioinformatics Terminal Hacks
series_sing: true
video_number: 1
video_id: WbgC0m0fsQ8

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/v1760001714/Terminal_Hacks_uap87c.png


category: Terminal Hacks
tags:
  - BASH
  - Terminal
author: alihassan
paginate: true
---


[![Alt text](https://res.cloudinary.com/bioinformaticsguy/image/upload/v1760001714/Terminal_Hacks_uap87c.png)](https://www.youtube.com/c/BioinformaticsGuy)



# Mastering SFTP: Secure File Transfer for Bioinformatics Workflows

## Navigate SSH Authentication Issues and Transfer Large Datasets with Confidence

**Description:** Learn how to troubleshoot common SFTP connection issues, understand SSH host key algorithms, and master essential commands for transferring bioinformatics data between local machines and remote servers.

---

Welcome to the first post in our **"HPC Essentials for Bioinformaticians"** series! As bioinformaticians, we constantly move large datasets between our local machines and high-performance computing (HPC) systems. Whether you're uploading raw sequencing data or downloading analysis results, understanding secure file transfer is fundamental to your workflow.

In this post, we'll demystify SFTP (Secure File Transfer Protocol), tackle common connection problems, and explore practical solutions you'll use daily.

## Understanding the Basic SFTP Connection

The standard SFTP command looks straightforward:

```bash
sftp username@server_address
```

But what happens when this simple command fails? Let's dive into a real-world scenario you'll likely encounter.

## The SSH-RSA Algorithm Problem

Modern bioinformatics often means working with older HPC systems that haven't updated their security protocols. Here's a common error you might see:

```
Unable to negotiate with 131.174.197.250 port 22: no matching host key type found. Their offer: ssh-rsa,ssh-dss
```

### Why Does This Happen?

Modern versions of OpenSSH (since version 8.8) have disabled the `ssh-rsa` algorithm by default due to security concerns. The problem arises when:

1. **Your local machine** runs a newer SSH client with strict security requirements
2. **The remote server** only supports older algorithms like `ssh-rsa` or `ssh-dss`
3. **The handshake fails** because they can't agree on a common, secure algorithm

Think of it like two people trying to communicate—one only speaks an old dialect, while the other refuses to use anything but modern language.

### The Solution: Explicitly Allowing SSH-RSA

To connect to servers that only support older algorithms, you need to explicitly tell your SSH client to allow them:

```bash
sftp -oPort=22 -oHostKeyAlgorithms=+ssh-rsa guest2@131.174.197.250
```

Let's break down this command:

- `sftp` - The secure file transfer protocol command
- `-oPort=22` - Specifies the port (22 is the default SSH port)
- `-oHostKeyAlgorithms=+ssh-rsa` - Adds `ssh-rsa` to the list of acceptable algorithms
- `guest2@131.174.197.250` - Your username and the server address

The `+ssh-rsa` prefix means "add this algorithm to the allowed list" rather than replacing the entire list.

### Security Considerations

Before you start adding this flag to every connection, consider these points:

**✅ Generally Safe For:**
- Trusted institutional HPC systems
- Closed network environments
- University computing clusters
- Internal research servers

**⚠️ Avoid Using For:**
- Unknown or public servers
- Untrusted networks
- Internet-facing systems
- Production environments with sensitive data

The `ssh-rsa` algorithm has known vulnerabilities to certain cryptographic attacks, which is why it's been deprecated. However, within trusted institutional networks—where you're not exposed to public internet threats—the risk is minimal.

## Essential SFTP Commands

Once connected, you'll need to navigate and transfer files. Here are the commands you'll use most often:

### Downloading a Folder Recursively

To download an entire directory and its contents:

```bash
get -r foldername
```

The `-r` flag stands for "recursive," meaning it will download the folder and everything inside it, maintaining the directory structure.

### Navigating in SFTP

While connected via SFTP, you can use familiar commands:

```bash
ls              # List files in the remote directory
cd dirname      # Change remote directory
lcd dirname     # Change local directory
pwd             # Show current remote directory
lpwd            # Show current local directory
```

### Uploading Files

To upload files to the remote server:

```bash
put filename              # Upload a single file
put -r foldername        # Upload a folder recursively
```

## Pro Tips for Efficient File Transfer

### Tip 1: Use Tab Completion

Just like in your terminal, you can use Tab to auto-complete file and directory names while in SFTP. This saves time and reduces typos.

### Tip 2: Check Before You Transfer

Before starting a large transfer, verify the file exists and check its size:

```bash
sftp> ls -lh filename
```

The `-lh` flags show the file size in human-readable format (KB, MB, GB).

### Tip 3: Resume Interrupted Transfers

SFTP doesn't natively support resuming interrupted transfers. For large files, consider using `rsync` instead (we'll cover this in a future post).

### Tip 4: Batch Operations

You can execute multiple SFTP commands from a script:

```bash
sftp -b commands.txt user@server
```

Where `commands.txt` contains your SFTP commands, one per line.

## Troubleshooting Common Issues

### Problem: "Permission Denied"

**Solution:** Check your username, password, or SSH key. Verify you have access to the server:

```bash
ssh username@server_address
```

If SSH works but SFTP doesn't, the server might have SFTP disabled.

### Problem: "Connection Timeout"

**Solution:** Check if you're on the correct network. Some HPC systems are only accessible from within the institution's network or through VPN.

### Problem: "Host Key Verification Failed"

**Solution:** The server's host key has changed (possibly due to server updates). Remove the old key:

```bash
ssh-keygen -R server_address
```

Then try connecting again. You'll be asked to verify and accept the new host key.

## When to Use SFTP vs. Other Transfer Methods

SFTP is ideal for:
- ✅ Interactive file browsing and transfer
- ✅ Small to medium-sized files
- ✅ When you need to navigate and select specific files
- ✅ Quick one-off transfers

Consider alternatives for:
- ❌ Very large datasets (use `rsync` or `aria2c`)
- ❌ Automated transfers (use `rsync` or `scp` in scripts)
- ❌ Synchronizing directories (use `rsync`)
- ❌ Resuming interrupted transfers (use `rsync` with `--partial`)

## Real-World Example: Connecting to an HPC System

Let's walk through a complete workflow:

**Step 1:** Connect to the server
```bash
sftp -oPort=22 -oHostKeyAlgorithms=+ssh-rsa myusername@hpc.university.edu
```

**Step 2:** Navigate to your data directory
```bash
sftp> cd /data/users/myusername/results
```

**Step 3:** Check what's available
```bash
sftp> ls -lh
```

**Step 4:** Download your analysis results
```bash
sftp> get -r analysis_output
```

**Step 5:** Exit when done
```bash
sftp> bye
```


## Using rsync for Efficient File Transfers

While SFTP works well for interactive transfers, `rsync` is the preferred tool for large datasets and automated transfers. Here's a basic example:

```bash
rsync -avh \
      --info=progress2 \
      --partial \
      /path/to/source/directory/ \
      /path/to/destination/
```

**Command breakdown:**

- `-a` : Archive mode (preserves permissions, timestamps, symbolic links, etc.)
- `-v` : Verbose output (shows files being transferred)
- `-h` : Human-readable file sizes (KB, MB, GB instead of bytes)
- `--info=progress2` : Shows overall transfer progress (better for large transfers)
- `--partial` : Keeps partially transferred files (allows resuming interrupted transfers)

### Resuming an Interrupted Transfer

If your transfer gets interrupted, you can resume it exactly where it left off:

```bash
rsync -avh \
      --info=progress2 \
      --partial \
      --append-verify \
      /path/to/source/directory/ \
      /path/to/destination/
```

The `--append-verify` flag resumes the transfer and verifies the integrity of the resumed file.

### Practical Examples

**Downloading from a remote server:**
```bash
rsync -avh \
      --info=progress2 \
      --partial \
      username@server:/data/analysis_results/ \
      ./local_results/
```

**Uploading to a remote server:**
```bash
rsync -avh \
      --info=progress2 \
      --partial \
      ./local_data/ \
      username@server:/data/uploaded_files/
```

**Important:** The trailing slash (`/`) on the source directory matters:
- `source/` copies the *contents* of source into destination
- `source` copies the *directory itself* into destination

## Looking Ahead

In the next post of our **HPC Essentials for Bioinformaticians** series, we'll explore `rsync`—a powerful tool for efficiently transferring and synchronizing large datasets. We'll cover how to resume interrupted transfers, verify file integrity with checksums, and optimize transfer speeds for genomic data.

## Key Takeaways

- Modern SSH clients disable older algorithms like `ssh-rsa` for security reasons
- Use `-oHostKeyAlgorithms=+ssh-rsa` to connect to older HPC systems
- This workaround is safe for trusted institutional servers
- SFTP is best for interactive transfers of small to medium files
- Understanding these basics will save you hours of troubleshooting

---

## Series Suggestion

**Series Name:** "HPC Essentials for Bioinformaticians"

**Proposed Series Structure:**
1. **Mastering SFTP: Secure File Transfer** (this post)
2. **Rsync Mastery: Efficient Data Transfer and Synchronization**
3. **High-Speed Downloads with aria2c**
4. **File System Management: Mounting Drives and Data Organization**
5. **MD5 Checksums: Ensuring Data Integrity**
6. **SLURM Job Management: Monitoring and Troubleshooting**
7. **Conda Environments: Reproducible Bioinformatics Pipelines**

*Have questions or encountered different SFTP errors? Drop a comment below, and let's troubleshoot together!*


# Pulling docker immage with singularity as a sif file

```bash 
singularity pull cadd-sv-1.1.2.sif docker://ocatona/cadd-sv:1.1.2
```
*Have questions or encountered different SFTP errors? Drop a comment below, and let's troubleshoot together!*
