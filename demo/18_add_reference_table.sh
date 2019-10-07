vtctlclient -server=TYPEYOURVTCTLDIPADDRESS:15999 ApplyVSchema -vschema='
{
  "sharded": true,
  "vindexes": {
    "hash": {
      "type": "hash"
    }
  },
  "tables": {
    "customer": {
      "columnVindexes": [
        {
          "column": "customer_id",
          "name": "hash"
        }
      ],
      "autoIncrement": {
        "column": "customer_id",
        "sequence": "customer_seq"
      }
    },
    "payment": {
      "columnVindexes": [
        {
          "column": "customer_id",
          "name": "hash"
        }
      ],
      "autoIncrement": {
        "column": "payment_id",
        "sequence": "payment_seq"
      }
    },
    "rental": {
      "columnVindexes": [
        {
          "column": "customer_id",
          "name": "hash"
        }
      ],
      "autoIncrement": {
        "column": "rental_id",
        "sequence": "rental_seq"
      }
    },
    "staff": {
      "type": "reference"
    }
  }
}' customer
