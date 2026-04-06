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
          "id": "6e4d9ae1-1c9b-439f-95fd-993e2d5b1d04",
          "type": "basic.output",
          "data": {
            "name": "value",
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
            ]
          },
          "position": {
            "x": 704,
            "y": 104
          }
        },
        {
          "id": "0da5cdb3-920e-4b80-9265-fdbd88076de7",
          "type": "basic.input",
          "data": {
            "name": "din",
            "virtual": false,
            "range": "[15:0]",
            "pins": [
              {
                "index": "15",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "14",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "13",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "12",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "11",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "10",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
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
            ],
            "clock": false
          },
          "position": {
            "x": -16,
            "y": 128
          }
        },
        {
          "id": "e396849c-b648-413b-8ea0-3299703ed107",
          "type": "basic.input",
          "data": {
            "name": "scan_clk",
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
            "x": 104,
            "y": 152
          }
        },
        {
          "id": "04d1b4bf-3623-4839-a635-d9f37dfaaf0c",
          "type": "basic.output",
          "data": {
            "name": "dig4",
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
            ]
          },
          "position": {
            "x": 704,
            "y": 320
          }
        },
        {
          "id": "a31d20ba-a746-408c-8b77-45a4e8665ef5",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "Clk_i"
                },
                {
                  "name": "DataIn",
                  "range": "[15:0]",
                  "size": 16
                }
              ],
              "out": [
                {
                  "name": "Seg",
                  "range": "[3:0]",
                  "size": 4
                },
                {
                  "name": "Post",
                  "range": "[3:0]",
                  "size": 4
                }
              ]
            },
            "params": [],
            "code": "reg [3:0] rVSegment;\r\nreg [3:0] rPosition;\r\nreg [1:0] rDispCnt;\r\n\r\nalways@(posedge Clk_i) begin\r\n    rDispCnt <= rDispCnt+1;\r\n    if (rDispCnt==3) begin\r\n        rVSegment = DataIn[15:12];\r\n        rPosition = 4'b1000;\r\n    end\r\n    if (rDispCnt==2) begin\r\n        rVSegment = DataIn[11:8];\r\n        rPosition = 4'b0100;\r\n    end\r\n    if (rDispCnt==1) begin\r\n        rVSegment = DataIn[7:4];\r\n        rPosition = 4'b0010;\r\n    end\r\n    if (rDispCnt==0) begin\r\n        rVSegment = DataIn[3:0];\r\n        rPosition = 4'b0001;\r\n    end\r\nend\r\n\r\nassign Post = rPosition;\r\nassign Seg  = rVSegment;"
          },
          "position": {
            "x": 240,
            "y": 72
          },
          "size": {
            "width": 400,
            "height": 440
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "e396849c-b648-413b-8ea0-3299703ed107",
            "port": "out"
          },
          "target": {
            "block": "a31d20ba-a746-408c-8b77-45a4e8665ef5",
            "port": "Clk_i"
          }
        },
        {
          "source": {
            "block": "0da5cdb3-920e-4b80-9265-fdbd88076de7",
            "port": "out"
          },
          "target": {
            "block": "a31d20ba-a746-408c-8b77-45a4e8665ef5",
            "port": "DataIn"
          },
          "size": 16
        },
        {
          "source": {
            "block": "a31d20ba-a746-408c-8b77-45a4e8665ef5",
            "port": "Seg"
          },
          "target": {
            "block": "6e4d9ae1-1c9b-439f-95fd-993e2d5b1d04",
            "port": "in"
          },
          "size": 4
        },
        {
          "source": {
            "block": "a31d20ba-a746-408c-8b77-45a4e8665ef5",
            "port": "Post"
          },
          "target": {
            "block": "04d1b4bf-3623-4839-a635-d9f37dfaaf0c",
            "port": "in"
          },
          "size": 4
        }
      ]
    }
  },
  "dependencies": {}
}