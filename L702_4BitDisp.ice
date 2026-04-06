{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "iCEBreaker",
    "graph": {
      "blocks": [
        {
          "id": "f9d1abdd-9d43-4e1b-bfe8-c9a32e3ae5ab",
          "type": "basic.output",
          "data": {
            "name": "di",
            "virtual": false,
            "range": "[6:0]",
            "pins": [
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 464,
            "y": -144
          }
        },
        {
          "id": "b67648ae-94ac-42f7-9aff-8d9145b29901",
          "type": "basic.input",
          "data": {
            "name": "a",
            "virtual": false,
            "range": "[3:0]",
            "pins": [
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -176,
            "y": -96
          }
        },
        {
          "id": "c7d5acb1-99ad-40f6-ab1c-0de09f821f2e",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "AI",
                  "range": "[3:0]",
                  "size": 4
                }
              ],
              "out": [
                {
                  "name": "DO",
                  "range": "[6:0]",
                  "size": 7
                }
              ]
            },
            "params": [],
            "code": "assign DO\r\n    = (AI == 4'b0000) ? 7'h7E :\r\n      (AI == 4'b0001) ? 7'h30 :\r\n      (AI == 4'b0010) ? 7'h6D :\r\n      (AI == 4'b0011) ? 7'h79 :\r\n      (AI == 4'b0100) ? 7'h33 :\r\n      (AI == 4'b0101) ? 7'h5B :\r\n      (AI == 4'b0110) ? 7'h5F :\r\n      (AI == 4'b0111) ? 7'h70 :\r\n      (AI == 4'b1000) ? 7'h7F :\r\n      (AI == 4'b1001) ? 7'h7B :\r\n      (AI == 4'b1010) ? 7'h77 :\r\n      (AI == 4'b1011) ? 7'h1F :\r\n      (AI == 4'b1100) ? 7'h4E :\r\n      (AI == 4'b1101) ? 7'h3D :\r\n      (AI == 4'b1110) ? 7'h4F :\r\n      (AI == 4'b1111) ? 7'h47 : 7'h00;"
          },
          "position": {
            "x": -24,
            "y": -176
          },
          "size": {
            "width": 408,
            "height": 312
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "c7d5acb1-99ad-40f6-ab1c-0de09f821f2e",
            "port": "DO"
          },
          "target": {
            "block": "f9d1abdd-9d43-4e1b-bfe8-c9a32e3ae5ab",
            "port": "in"
          },
          "size": 7
        },
        {
          "source": {
            "block": "b67648ae-94ac-42f7-9aff-8d9145b29901",
            "port": "out"
          },
          "target": {
            "block": "c7d5acb1-99ad-40f6-ab1c-0de09f821f2e",
            "port": "AI"
          },
          "size": 4
        }
      ]
    }
  },
  "dependencies": {}
}