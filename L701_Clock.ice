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
          "id": "ce8a4259-6ca2-46d2-aeb3-ff03e2f84e67",
          "type": "basic.output",
          "data": {
            "name": "1hz",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 720,
            "y": 160
          }
        },
        {
          "id": "8d7f4e6b-a211-4ef0-8f9a-cc8473a9b537",
          "type": "basic.input",
          "data": {
            "name": "clk_i",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -16,
            "y": 280
          }
        },
        {
          "id": "96edc1ec-b976-4b73-8eef-ee3480636309",
          "type": "basic.output",
          "data": {
            "name": "1000hz",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 712,
            "y": 408
          }
        },
        {
          "id": "ab0c4406-ca85-475f-9cb4-3f3c757685b5",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "clk_i"
                }
              ],
              "out": [
                {
                  "name": "clk_1Hz"
                },
                {
                  "name": "clk_1000Hz"
                }
              ]
            },
            "params": [],
            "code": "reg rQ2H = 1'b0;\r\nreg rQ2K = 1'b0;\r\nreg [27:0] CounterH;\r\nreg [27:0] CounterK;\r\nparameter fin    = 12_000_000; // Freq Input\r\nparameter foutH  = 1;          // Freq Output\r\nparameter foutK  = 1_000;      // Freq Output\r\nparameter ConstH = fin/(2*foutH);\r\nparameter ConstK = fin/(2*foutK);\r\n\r\nalways@(posedge clk_i)\r\nbegin\r\n    CounterH <= CounterH + 1;\r\n    if ( CounterH == ConstH)\r\n    begin\r\n        CounterH <= 0;\r\n        rQ2H <= ~rQ2H;\r\n    end\r\n\r\n    CounterK <= CounterK + 1;\r\n    if ( CounterK == ConstK)\r\n    begin\r\n        CounterK <= 0;\r\n        rQ2K <= ~rQ2K;\r\n    end\r\nend\r\n\r\nassign clk_1000Hz = rQ2K;\r\nassign clk_1Hz    = rQ2H;"
          },
          "position": {
            "x": 160,
            "y": 64
          },
          "size": {
            "width": 464,
            "height": 496
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "8d7f4e6b-a211-4ef0-8f9a-cc8473a9b537",
            "port": "out"
          },
          "target": {
            "block": "ab0c4406-ca85-475f-9cb4-3f3c757685b5",
            "port": "clk_i"
          }
        },
        {
          "source": {
            "block": "ab0c4406-ca85-475f-9cb4-3f3c757685b5",
            "port": "clk_1Hz"
          },
          "target": {
            "block": "ce8a4259-6ca2-46d2-aeb3-ff03e2f84e67",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "ab0c4406-ca85-475f-9cb4-3f3c757685b5",
            "port": "clk_1000Hz"
          },
          "target": {
            "block": "96edc1ec-b976-4b73-8eef-ee3480636309",
            "port": "in"
          }
        }
      ]
    }
  },
  "dependencies": {}
}