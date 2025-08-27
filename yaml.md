# YAML language

[YAML](https://yaml.org/), which stands for "YAML Ain't Markup Language" is a data serialization language used by Kubernetes for representing *resources*, in documents normally known as *manifests*. It is very similar to the well-known [JSON](https://www.json.org/json-es.html) ("JavaScript Object Notation") normally used in HTTP RESTful APIs; both of these are languages that intend to be great at representing structured and unstructured data in a way that's easily honored by transmitters and effortlessly interpreted by receivers. In fact, YAML is considered to be a JSON superset and data can be seamlessly converted between these two, to the point that the `kubectl` CLI can work with both.

## Brief hitory

YAML has been around for a while (since 2004) and is actually tool-agnostic (which makes sense given its purpose). It has been adopted by tools such as Ansible, Prometheus, etc, and it is closely related to Python when it comes to the primary data types and structures it can represent, and it even uses its indentation style.

## Syntax

YAML syntax is controversial due to its laxity (f.e. valid booleans are "truthy" values like yes/no, true/false), which makes writing it super opinionated. I've personally grown accustomed to the linter called [yamllint](https://yamllint.readthedocs.io/en/stable/) and I usually try and run my YAML documents through it, with the default rules enabled, which are pretty reasonable (but certainly opinionated!).

### Data types

The YAML spec is quite large, but in reality, one only ever ends up using four types of data, in the most Python-like fashion:

- Scalars (as in atomic values):
  - Booleans
  - Numbers (integers and floating point)
  - Strings (with support for multi-line and space-separated concatenation)
- Sequence (i.e. lists)
- Mapping (i.e. dicts)

The simplicity of those data types and the human-readable API contract Kubernetes uses on YAML makes interpreting *resource manifests* real easy, once you get used to the syntax.

Some examples of the data structures below, ironically using YAML to explain YAML:

```yaml
# This is a comment

# This determines the beginning of a document
---
# Below are scalars
thisIsRighteousBoolean: true
thisIsAnInteger: 3
butThisIsAFloat: 3.14
andThisBeString: "Very string indeed"

# Below is a sequence
myList:
  - hasIndexedOrder
  - butHasNoKeys

# Below is a mapping:
coolPerson:
  name: John
  surname: Doe
  username: john.doe
  age: 27
  enabled: true
  surnames:
    - Johnny
    - JD

# Sequences can have complex data too
myComplexList:
  - iAmAnItem:
      price: 500
      discountPercent: 0.2
  - yetAnotherItem:
      price: 1400
      discountPercent: 0.05
      maxQuantity: 1

# It is good practice to leave empty newlines at the end of a file

```
