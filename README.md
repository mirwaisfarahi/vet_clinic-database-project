# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [📝 License](#license)

# 📖 [Vet Clinic Database] <a name="about-project"></a>

> **The Vet Clinic Database** is a relational database built using PostgreSQL. It is a project that store details of animals in a farm and also generates specific reports using SQL queries.
> It is made up of a series of tables which include

- Animals table
- Animal's owners
- Clinic employees
- Visits

## 🛠 Built With <a name="built-with"></a>

- Database language: SQL
- Technologies used: Git, Github and Gitflow

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **[Create query for animal table]**
- **[Query for update animals table]**
- **[Queries for reporting from animal table]**
- **[Create query for owners and species tables]**
- **[Alter query for animal table]**
- **[Foreign Key references for tables]**
- **[Join queries for reporting from all animals, owners and species tables]**
- **[create queries for visits, specializations tables]**
- **[Join queries for for visits and specialization tables]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

### Prerequisites

- install PosgreSQL Database

### Setup

- Clone this repository to your desired folder:

```
git clone https://github.com/Mikey1-nuel/vet_clinic_database.git
cd vet_clinic_database
```

### Install

To run the project, execute the following command:

```
psql -u postgres
```

## 👥 Authors <a name="authors"></a>

👤 **Mirwais Farahi**

- GitHub: [@githubhandle](https://github.com/mirwaisfarahi)
- Twitter: [@twitterhandle](https://twitter.com/farahi92)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

> Describe 1 - 3 features you will add to the project.

- [ ] **[Database performance audit]**
- [ ] **[Add database schema diagram]**

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

Give a ⭐️ if you like this project!

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- Hat tip to Microverse's code reviewers and to everyone who reviewed my project and made suggestions.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.
