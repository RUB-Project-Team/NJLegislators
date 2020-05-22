-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE TABLE "Dist_Municipality" (
    "Dist_ID" int   NOT NULL,
    "District" varchar(12)   NOT NULL,
    "Town" varchar(50)   NOT NULL,
    "County" varchar(25)   NOT NULL,
    CONSTRAINT "pk_Dist_Municipality" PRIMARY KEY (
        "Town","County"
     )
);

CREATE TABLE "Senators" (
    "Dist_ID" int   NOT NULL,
    "Name" varchar(100)   NOT NULL,
    "Affiliation" varchar(15)   NOT NULL,
    CONSTRAINT "pk_Senators" PRIMARY KEY (
        "Dist_ID"
     )
);

CREATE TABLE "SenatorAddress" (
    "Address_ID" int   NOT NULL,
    "Dist_ID" int   NOT NULL,
    "Add_No" int   NOT NULL,
    "Address" varchar(500)   NOT NULL,
    CONSTRAINT "pk_SenatorAddress" PRIMARY KEY (
        "Address_ID"
     )
);

CREATE TABLE "Assembly" (
    "Dist_ID" int   NOT NULL,
    "Name" varchar(100)   NOT NULL,
    "Affiliation" varchar(15)   NOT NULL
);

CREATE TABLE "AssemblyPersonAddress" (
    "Address_ID" int   NOT NULL,
    "Dist_ID" int   NOT NULL,
    "Add_No" int   NOT NULL,
    "Address" varchar(500)   NOT NULL,
    CONSTRAINT "pk_AssemblyPersonAddress" PRIMARY KEY (
        "Address_ID"
     )
);

CREATE TABLE "MunicipalMayors" (
    "Town" varchar(25)   NOT NULL,
    "Muni_Code" int   NOT NULL,
    "Muni_Name" varchar(50)   NOT NULL,
    "Mayor_Name" varchar(100)   NOT NULL,
    "eMail" varchar(100)   NOT NULL,
    "Address" varchar(500)   NOT NULL,
    "Phone" varchar(25)   NOT NULL,
    "County" varchar(25)   NOT NULL,
    "Term_End" varchar(20)   NOT NULL,
    CONSTRAINT "pk_MunicipalMayors" PRIMARY KEY (
        "Town","County"
     )
);

ALTER TABLE "Dist_Municipality" ADD CONSTRAINT "fk_Dist_Municipality_Dist_ID" FOREIGN KEY("Dist_ID")
REFERENCES "Senators" ("Dist_ID");

ALTER TABLE "Dist_Municipality" ADD CONSTRAINT "fk_Dist_Municipality_Town_County" FOREIGN KEY("Town", "County")
REFERENCES "MunicipalMayors" ("Town", "County");

ALTER TABLE "SenatorAddress" ADD CONSTRAINT "fk_SenatorAddress_Dist_ID" FOREIGN KEY("Dist_ID")
REFERENCES "Senators" ("Dist_ID");

ALTER TABLE "Assembly" ADD CONSTRAINT "fk_Assembly_Dist_ID" FOREIGN KEY("Dist_ID")
REFERENCES "Senators" ("Dist_ID");

ALTER TABLE "AssemblyPersonAddress" ADD CONSTRAINT "fk_AssemblyPersonAddress_Dist_ID" FOREIGN KEY("Dist_ID")
REFERENCES "Senators" ("Dist_ID");

