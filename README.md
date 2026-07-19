Privacy-Preserving Model-as-a-Service (MaaS) PlatformAn enterprise-ready, cryptographically secure Model-as-a-Service (MaaS) microservice and web application built with Python and Flask. This project introduces a secure cloud-based AI service framework implementing Fully Homomorphic Encryption (FHE) via Microsoft SEAL (PySEAL).It enables untrusted cloud infrastructure to execute high-performance machine learning inference directly on encrypted user data. The underlying algorithms guarantee that neither private user inputs nor proprietary model parameters are decrypted during computation, eliminating the risk of data breaches, model inversion, or inference leakage attacks.🔒 Cryptographic Core: Fully Homomorphic Encryption (FHE)Traditional encryption schemes protect data "at rest" and "in transit" but require decryption "in use" (during processing). This project implements the Brakerski-Fan-Vercauteren (BFV) homomorphic encryption scheme, allowing mathematical operations to be executed on encrypted ciphertexts:
Code snippetflowchart TD
    
    %% Define Subgraphs to distinguish secure vs insecure environments
    subgraph ClientSpace [🔒 Secure Client Local Machine]
        direction LR
        Plaintext[Raw Plaintext Data: m]
        Decrypted[Decrypted Final Result: f m]
    end

    subgraph UntrustedCloud [☁️ Cloud Server / MaaS Space]
        direction LR
        Ciphertext[Encrypted Ciphertext: Enc m]
        CalculatedCipher[Encrypted Calculation Result: Enc f m]
    end

    %% Cryptographic Operations Flow
    Plaintext -->|1. FHE Encrypt| Ciphertext
    Ciphertext -->|2. Secure Homomorphic Evaluation: f| CalculatedCipher
    CalculatedCipher -->|3. Local Decrypt| Decrypted

    %% Styling
    classDef client fill:#1e293b,stroke:#3b82f6,stroke-width:2px,color:#fff;
    classDef cloud fill:#0f172a,stroke:#f59e0b,stroke-width:2px,color:#fff;
    class Plaintext,Decrypted client;
    class Ciphertext,CalculatedCipher cloud;
Mathematical FoundationsAdditive Homomorphic Property: Adding two ciphertexts yields an encrypted sum without decrypting the values:$$\text{Dec}(\text{Enc}(m_1) \oplus \text{Enc}(m_2)) = m_1 + m_2$$Multiplicative Homomorphic Property: Multiplying two ciphertexts yields an encrypted product:$$\text{Dec}(\text{Enc}(m_1) \otimes \text{Enc}(m_2)) = m_1 \times m_2$$Arbitrary Function Evaluation: For any model computation pipeline represented by a circuit $f$:$$\text{Dec}(f(\text{Enc}(m_1), \dots, \text{Enc}(m_n))) = f(m_1, \dots, m_n)$$In this system, the Plaintext Modulus is configured to $t = 1024$ and the Polynomial Modulus Degree to $N = 4096$, balancing robust security guarantees against quantum-class attacks with real-world execution speeds.🧠 System Architecture & WorkflowThe platform decouples operations among three distinct entities: the Model Owner, the Model User, and the MaaS Cloud Service Provider (Admin), using a zero-trust model.
Code snippetgraph TD
    
    %% Define Nodes
    subgraph Userspace [Local Client Space]
        User[AI Model User]
        Owner[Model Owner / Developer]
    end

    subgraph ServiceProvider [MaaS Cloud Space]
        Provider[AI Model Service Server]
        DB[(MySQL 5 Database)]
    end

    %% Key Generation & Registration Protocol
    Owner -->|1. Register/Login| Provider
    User -->|1. Register/Login| Provider
    Provider -->|2. Generate Cryptographic Keys| DB
    Provider -.->|3. Public Key| Owner
    Provider -.->|3. Private Key| User

    %% Model Deployment Phase
    Owner -->|4. Encrypt Model Features| Owner
    Owner -->|5. Deploy Encrypted CNN Parameters| Provider
    Provider -->|6. Store Encrypted Model| DB

    %% Inference Phase
    User -->|7. Encrypt Input Data| User
    User -->|8. Upload Encrypted Ciphertext| Provider
    Provider -->|9. Secure FHE Circuit Evaluation| Provider
    Provider -->|10. Generate Encrypted Predictions| Provider
    Provider -->|11. Send Encrypted Results| User
    User -->|12. Decrypt locally with Secret Key| User

    %% Styling
    classDef client fill:#3b82f6,stroke:#1d4ed8,stroke-width:2px,color:#fff;
    classDef cloud fill:#1e293b,stroke:#475569,stroke-width:2px,color:#fff;
    classDef database fill:#10b981,stroke:#047857,stroke-width:2px,color:#fff;
    class User,Owner client;
    class Provider cloud;
    class DB database;
🚀 Key FeaturesEnd-to-End Encryption: Inputs remain securely masked as random-noise ciphertexts during transmission, database storage, and active execution phases.Microsoft SEAL Core: Built on top of PySEAL bindings to guarantee high-throughput, memory-safe, and hardware-optimized lattice-based cryptographic computations.Integrated Facial Recognition Case Study: Features an integrated CrimeNet face classification module (93.54% validation accuracy) to demonstrate privacy-preserving suspect matching.Multi-Tenant Access Control: Dedicated, secure routing, credential hashing, and session management for Admins, Developers, and Public Users.Live System Auditing: Full database logging of active query counts, calculation processing latencies, client IP addresses, and FHE parameter metrics.🛠️ Technology StackBackend Engine: Flask 1.1 (Python 3.8)Cryptographic Engine: Microsoft SEAL (PySEAL)Neural Networks & ML: TensorFlow, Scikit-Learn, NumPy, Pandas, MatplotlibDatabase Management: MySQL 5.x / MariaDB (connected via mysql-connector)Local Hosting Stack: WampServer / XAMPP (Apache web container)Frontend Design: HTML5, CSS3, Bootstrap 4 (responsive layouts)💻 Local Installation & Database SetupFollow these instructions to configure and run the privacy-preserving application on your local machine:PrerequisitesOperating System: Windows 10/11Runtime: Python 3.8 (64-bit recommended)Web Server Stack: WampServer or XAMPP installed and running1. Database Setup (MySQL)Boot up WampServer and open phpMyAdmin in your browser (http://localhost/phpmyadmin).Create a new database named: MaaS_model.Import the database structure. In your terminal, run the following command (or paste your schema .sql file inside the phpMyAdmin console):SQLCREATE DATABASE IF NOT EXISTS MaaS_model;
USE MaaS_model;

-- Table for developer registration records
CREATE TABLE IF NOT EXISTS am_developer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    mobile VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    uname VARCHAR(255) NOT NULL UNIQUE,
    pass VARCHAR(255) NOT NULL,
    create_date VARCHAR(50) NOT NULL,
    public_key TEXT,
    private_key TEXT
);
2. Configure Local Virtual EnvironmentClone the repository and build an isolated runtime sandbox:DOSgit clone https://github.com/afnanp901-beep/aiaas-flask-model.git
cd aiaas-flask-model

python -m venv venv
venv\Scripts\activate
3. Install Core DependenciesInstall the cryptographic binaries alongside standard mathematical packages:DOSpip install -r requirements.txt
(Note: Ensure PySEAL binaries matching your Python architecture are correctly referenced inside your local search paths).4. Boot the Application ServerStart your server instances using the default local route:DOSpython main.py
Now, navigate your web browser to http://localhost:5000 to access the homepage!🔬 System Evaluation & Test ReportTest IDInput / ActionExpected OutputStatusTC001User uploads encrypted biometric imageAccepted and queued for computationPass ✅TC002User attempts raw plain text uploadRejected with manual encryption noticePass ✅TC003Circuit arithmetic computation ($E(m) \otimes E(w)$)Correctly outputs output ciphertext $E(y)$Pass ✅TC005Authorized decryption key appliedCiphertext returns clean plaintext detailsPass ✅TC006Incorrect private key executionDecryption routine yields cryptographic noisePass ✅🔮 Future EnhancementsMobile Integration: Building native iOS and Android application templates for secure on-the-go FHE inquiries.Immutable Audits via Blockchain: Integrating decentralised distributed ledgers to securely record encrypted access trails.Large-scale GPU Optimization: Offloading homomorphic evaluations to CUDA pipelines to significantly reduce latency on highly complex layers.
