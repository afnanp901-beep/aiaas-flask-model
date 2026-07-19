Privacy-Preserving Model-as-a-Service (MaaS) Platform



An enterprise-ready, cryptographically secure Model-as-a-Service (MaaS) microservice and web application built with Python and Flask. This project introduces a secure cloud-based AI service framework implementing Fully Homomorphic Encryption (FHE) via Microsoft SEAL (PySEAL).



It enables untrusted cloud infrastructure to execute high-performance machine learning inference directly on encrypted user data. The underlying algorithms guarantee that neither private user inputs nor proprietary model parameters are decrypted during computation, eliminating the risk of data breaches, model inversion, or inference leakage attacks.



🔒 Cryptographic Core: Fully Homomorphic Encryption (FHE)



Traditional encryption schemes protect data "at rest" and "in transit" but require decryption "in use" (during processing). This project implements the Brakerski-Fan-Vercauteren (BFV) homomorphic encryption scheme, allowing mathematical operations to be executed on encrypted ciphertexts:



flowchart TD

&#x20;   %% Define Subgraphs to distinguish secure vs insecure environments

&#x20;   subgraph ClientSpace \[🔒 Secure Client Local Machine]

&#x20;       direction LR

&#x20;       Plaintext\[Raw Plaintext Data: m]

&#x20;       Decrypted\[Decrypted Final Result: f m]

&#x20;   end



&#x20;   subgraph UntrustedCloud \[☁️ Cloud Server / MaaS Space]

&#x20;       direction LR

&#x20;       Ciphertext\[Encrypted Ciphertext: Enc m]

&#x20;       CalculatedCipher\[Encrypted Calculation Result: Enc f m]

&#x20;   end



&#x20;   %% Cryptographic Operations Flow

&#x20;   Plaintext -->|1. FHE Encrypt| Ciphertext

&#x20;   Ciphertext -->|2. Secure Homomorphic Evaluation: f| CalculatedCipher

&#x20;   CalculatedCipher -->|3. Local Decrypt| Decrypted



&#x20;   %% Styling

&#x20;   classDef client fill:#1e293b,stroke:#3b82f6,stroke-width:2px,color:#fff;

&#x20;   classDef cloud fill:#0f172a,stroke:#f59e0b,stroke-width:2px,color:#fff;

&#x20;   class Plaintext,Decrypted client;

&#x20;   class Ciphertext,CalculatedCipher cloud;





Mathematical Foundations



Additive Homomorphic Property: Adding two ciphertexts yields an encrypted sum without decrypting the values:





$$\\text{Dec}(\\text{Enc}(m\_1) \\oplus \\text{Enc}(m\_2)) = m\_1 + m\_2$$



Multiplicative Homomorphic Property: Multiplying two ciphertexts yields an encrypted product:





$$\\text{Dec}(\\text{Enc}(m\_1) \\otimes \\text{Enc}(m\_2)) = m\_1 \\times m\_2$$



Arbitrary Function Evaluation: For any model computation pipeline represented by a circuit $f$:





$$\\text{Dec}(f(\\text{Enc}(m\_1), \\dots, \\text{Enc}(m\_n))) = f(m\_1, \\dots, m\_n)$$



In this system, the Plaintext Modulus is configured to $t = 1024$ and the Polynomial Modulus Degree to $N = 4096$, balancing robust security guarantees against quantum-class attacks with real-world execution speeds.



🧠 System Architecture \& Workflow



The platform decouples operations among three distinct entities: the Model Owner, the Model User, and the MaaS Cloud Service Provider (Admin), using a zero-trust model.



graph TD

&#x20;   %% Define Nodes

&#x20;   subgraph Userspace \[Local Client Space]

&#x20;       User\[AI Model User]

&#x20;       Owner\[Model Owner / Developer]

&#x20;   end



&#x20;   subgraph ServiceProvider \[MaaS Cloud Space]

&#x20;       Provider\[AI Model Service Server]

&#x20;       DB\[(MySQL 5 Database)]

&#x20;   end



&#x20;   %% Key Generation \& Registration Protocol

&#x20;   Owner -->|1. Register/Login| Provider

&#x20;   User -->|1. Register/Login| Provider

&#x20;   Provider -->|2. Generate Cryptographic Keys| DB

&#x20;   Provider -.->|3. Public Key| Owner

&#x20;   Provider -.->|3. Private Key| User



&#x20;   %% Model Deployment Phase

&#x20;   Owner -->|4. Encrypt Model Features| Owner

&#x20;   Owner -->|5. Deploy Encrypted CNN Parameters| Provider

&#x20;   Provider -->|6. Store Encrypted Model| DB



&#x20;   %% Inference Phase

&#x20;   User -->|7. Encrypt Input Data| User

&#x20;   User -->|8. Upload Encrypted Ciphertext| Provider

&#x20;   Provider -->|9. Secure FHE Circuit Evaluation| Provider

&#x20;   Provider -->|10. Generate Encrypted Predictions| Provider

&#x20;   Provider -->|11. Send Encrypted Results| User

&#x20;   User -->|12. Decrypt locally with Secret Key| User



&#x20;   %% Styling

&#x20;   classDef client fill:#3b82f6,stroke:#1d4ed8,stroke-width:2px,color:#fff;

&#x20;   classDef cloud fill:#1e293b,stroke:#475569,stroke-width:2px,color:#fff;

&#x20;   classDef database fill:#10b981,stroke:#047857,stroke-width:2px,color:#fff;

&#x20;   class User,Owner client;

&#x20;   class Provider cloud;

&#x20;   class DB database;





🚀 Key Features



End-to-End Encryption: Inputs remain securely masked as random-noise ciphertexts during transmission, database storage, and active execution phases.



Microsoft SEAL Core: Built on top of PySEAL bindings to guarantee high-throughput, memory-safe, and hardware-optimized lattice-based cryptographic computations.



Integrated Facial Recognition Case Study: Features an integrated CrimeNet face classification module (93.54% validation accuracy) to demonstrate privacy-preserving suspect matching.



Multi-Tenant Access Control: Dedicated, secure routing, credential hashing, and session management for Admins, Developers, and Public Users.



Live System Auditing: Full database logging of active query counts, calculation processing latencies, client IP addresses, and FHE parameter metrics.



🛠️ Technology Stack



Backend Engine: Flask 1.1 (Python 3.8)



Cryptographic Engine: Microsoft SEAL (PySEAL)



Neural Networks \& ML: TensorFlow, Scikit-Learn, NumPy, Pandas, Matplotlib



Database Management: MySQL 5.x / MariaDB (connected via mysql-connector)



Local Hosting Stack: WampServer / XAMPP (Apache web container)



Frontend Design: HTML5, CSS3, Bootstrap 4 (responsive layouts)



💻 Local Installation \& Database Setup



Follow these instructions to configure and run the privacy-preserving application on your local machine:



Prerequisites



Operating System: Windows 10/11



Runtime: Python 3.8 (64-bit recommended)



Web Server Stack: WampServer or XAMPP installed and running



1\. Database Setup (MySQL)



Boot up WampServer and open phpMyAdmin in your browser (http://localhost/phpmyadmin).



Create a new database named: MaaS\_model.



Import the database structure. In your terminal, run the following command (or paste your schema .sql file inside the phpMyAdmin console):



CREATE DATABASE IF NOT EXISTS MaaS\_model;

USE MaaS\_model;



\-- Table for developer registration records

CREATE TABLE IF NOT EXISTS am\_developer (

&#x20;   id INT AUTO\_INCREMENT PRIMARY KEY,

&#x20;   name VARCHAR(255) NOT NULL,

&#x20;   mobile VARCHAR(15) NOT NULL,

&#x20;   email VARCHAR(255) NOT NULL,

&#x20;   location VARCHAR(255) NOT NULL,

&#x20;   country VARCHAR(255) NOT NULL,

&#x20;   uname VARCHAR(255) NOT NULL UNIQUE,

&#x20;   pass VARCHAR(255) NOT NULL,

&#x20;   create\_date VARCHAR(50) NOT NULL,

&#x20;   public\_key TEXT,

&#x20;   private\_key TEXT

);





2\. Configure Local Virtual Environment



Clone the repository and build an isolated runtime sandbox:



git clone https://github.com/afnanp901-beep/aiaas-flask-model.git

cd aiaas-flask-model



python -m venv venv

venv\\Scripts\\activate





3\. Install Core Dependencies



Install the cryptographic binaries alongside standard mathematical packages:



pip install -r requirements.txt





(Note: Ensure PySEAL binaries matching your Python architecture are correctly referenced inside your local search paths).



4\. Boot the Application Server



Start your server instances using the default local route:



python main.py





Now, navigate your web browser to http://localhost:5000 to access the homepage!



🔬 System Evaluation \& Test Report



Test ID



Input / Action



Expected Output



Status



TC001



User uploads encrypted biometric image



Accepted and queued for computation



Pass ✅



TC002



User attempts raw plain text upload



Rejected with manual encryption notice



Pass ✅



TC003



Circuit arithmetic computation ($E(m) \\otimes E(w)$)



Correctly outputs output ciphertext $E(y)$



Pass ✅



TC005



Authorized decryption key applied



Ciphertext returns clean plaintext details



Pass ✅



TC006



Incorrect private key execution



Decryption routine yields cryptographic noise



Pass ✅



🔮 Future Enhancements



Mobile Integration: Building native iOS and Android application templates for secure on-the-go FHE inquiries.



Immutable Audits via Blockchain: Integrating decentralised distributed ledgers to securely record encrypted access trails.



Large-scale GPU Optimization: Offloading homomorphic evaluations to CUDA pipelines to significantly reduce latency on highly complex layers.

