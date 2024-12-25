#!/bin/bash

# Cria o arquivo de datasource
cat <<EOF > datasource.yaml
apiVersion: 1
datasources:
  - name: Prometheus
    type: prometheus
    access: proxy
    url: http://prometheus-service:9090
    isDefault: true
    editable: false
EOF

# Cria o arquivo de dashboards
cat <<EOF > dashboards.yaml
apiVersion: 1
providers:
  - name: Default
    orgId: 1
    folder: ""
    type: file
    options:
      path: /var/lib/grafana/dashboards
EOF

# Configuração de um dashboard de exemplo
mkdir -p dashboards
cat <<EOF > dashboards/API-dashboard.json
{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "grafana",
          "uid": "-- Grafana --"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "fiscalYearStartMonth": 0,
  "graphTooltip": 0,
  "id": 1,
  "links": [],
  "panels": [
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 5,
      "panels": [],
      "title": "Visão Geral",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 1
      },
      "id": 4,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "editorMode": "code",
          "expr": "rate(process_cpu_seconds_total[5m])",
          "legendFormat": "__auto",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Uso de CPU",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 1
      },
      "id": 2,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "editorMode": "code",
          "expr": "time() - process_start_time_seconds",
          "legendFormat": "__auto",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Tempo de Atividade do Processo",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 9
      },
      "id": 1,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "editorMode": "code",
          "expr": "sum by (endpoint, http_status) (rate(flask_api_requests_total[5m]))",
          "legendFormat": "__auto",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Total de Requisições por Endpoint e Status",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 9
      },
      "id": 3,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "editorMode": "code",
          "expr": "process_resident_memory_bytes",
          "legendFormat": "__auto",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Uso de Memória",
      "type": "timeseries"
    },
    {
      "collapsed": true,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 17
      },
      "id": 9,
      "panels": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisBorderShow": false,
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "barWidthFactor": 0.6,
                "drawStyle": "line",
                "fillOpacity": 0,
                "gradientMode": "none",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "insertNulls": false,
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "auto",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 0,
            "y": 17
          },
          "id": 6,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "11.4.0",
          "targets": [
            {
              "editorMode": "code",
              "expr": "histogram_quantile(0.95, sum(rate(flask_api_request_duration_seconds_bucket[5m])) by (le))",
              "legendFormat": "__auto",
              "range": true,
              "refId": "A"
            }
          ],
          "title": "Latência das Requisições",
          "type": "timeseries"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisBorderShow": false,
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "barWidthFactor": 0.6,
                "drawStyle": "line",
                "fillOpacity": 0,
                "gradientMode": "none",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "insertNulls": false,
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "auto",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 12,
            "y": 17
          },
          "id": 8,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "11.4.0",
          "targets": [
            {
              "editorMode": "code",
              "expr": "sum(rate(flask_api_request_duration_seconds_bucket{le=\"0.5\"}[5m])) by (endpoint)",
              "legendFormat": "__auto",
              "range": true,
              "refId": "A"
            }
          ],
          "title": "Requisições Lentas",
          "type": "timeseries"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisBorderShow": false,
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "barWidthFactor": 0.6,
                "drawStyle": "line",
                "fillOpacity": 0,
                "gradientMode": "none",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "insertNulls": false,
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "auto",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 0,
            "y": 25
          },
          "id": 7,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "11.4.0",
          "targets": [
            {
              "editorMode": "code",
              "expr": "sum(rate(flask_api_request_duration_seconds_sum[5m])) / sum(rate(flask_api_request_duration_seconds_count[5m]))",
              "legendFormat": "__auto",
              "range": true,
              "refId": "A"
            }
          ],
          "title": "Somatório",
          "type": "timeseries"
        }
      ],
      "title": "Desempenho",
      "type": "row"
    },
    {
      "collapsed": true,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 18
      },
      "id": 11,
      "panels": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisBorderShow": false,
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "barWidthFactor": 0.6,
                "drawStyle": "line",
                "fillOpacity": 0,
                "gradientMode": "none",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "insertNulls": false,
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "auto",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 0,
            "y": 17
          },
          "id": 10,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "11.4.0",
          "targets": [
            {
              "editorMode": "code",
              "expr": "sum(rate(flask_api_requests_total{http_status=~\"4..|5..\"}[5m])) by (http_status, endpoint)",
              "legendFormat": "__auto",
              "range": true,
              "refId": "A"
            }
          ],
          "title": "Requisições com Erro",
          "type": "timeseries"
        }
      ],
      "title": "Erros e Alertas",
      "type": "row"
    },
    {
      "collapsed": true,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 19
      },
      "id": 14,
      "panels": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisBorderShow": false,
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "barWidthFactor": 0.6,
                "drawStyle": "line",
                "fillOpacity": 0,
                "gradientMode": "none",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "insertNulls": false,
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "auto",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 0,
            "y": 17
          },
          "id": 13,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "11.4.0",
          "targets": [
            {
              "editorMode": "code",
              "expr": "rate(python_gc_collections_total[5m])\n",
              "legendFormat": "__auto",
              "range": true,
              "refId": "A"
            }
          ],
          "title": "Número de Coletas promql Copiar código",
          "type": "timeseries"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisBorderShow": false,
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "barWidthFactor": 0.6,
                "drawStyle": "line",
                "fillOpacity": 0,
                "gradientMode": "none",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "insertNulls": false,
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "auto",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 12,
            "y": 17
          },
          "id": 12,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "11.4.0",
          "targets": [
            {
              "disableTextWrap": false,
              "editorMode": "code",
              "expr": "python_gc_objects_collected_total {job=\"flask-api\"}",
              "fullMetaSearch": false,
              "includeNullMetadata": true,
              "legendFormat": "__auto",
              "range": true,
              "refId": "A",
              "useBackend": false
            }
          ],
          "title": "Objetos Coletados por Geração",
          "type": "timeseries"
        }
      ],
      "title": "Garbage Collector",
      "type": "row"
    },
    {
      "collapsed": true,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 20
      },
      "id": 17,
      "panels": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisBorderShow": false,
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "barWidthFactor": 0.6,
                "drawStyle": "line",
                "fillOpacity": 0,
                "gradientMode": "none",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "insertNulls": false,
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "auto",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 0,
            "y": 17
          },
          "id": 16,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "11.4.0",
          "targets": [
            {
              "editorMode": "code",
              "expr": "process_open_fds / process_max_fds",
              "legendFormat": "__auto",
              "range": true,
              "refId": "A"
            }
          ],
          "title": "Limites de Descritores",
          "type": "timeseries"
        },
        {
          "datasource": {
            "uid": "prometheus"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisBorderShow": false,
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "barWidthFactor": 0.6,
                "drawStyle": "line",
                "fillOpacity": 0,
                "gradientMode": "none",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "insertNulls": false,
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "auto",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green"
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 12,
            "y": 17
          },
          "id": 15,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "single",
              "sort": "none"
            }
          },
          "pluginVersion": "11.4.0",
          "targets": [
            {
              "editorMode": "code",
              "expr": "python_info\n",
              "legendFormat": "__auto",
              "range": true,
              "refId": "A"
            }
          ],
          "title": "Versão do Python",
          "transformations": [
            {
              "id": "filterByValue",
              "options": {
                "filters": [],
                "match": "any",
                "type": "include"
              }
            }
          ],
          "type": "timeseries"
        }
      ],
      "title": "Detalhes Técnicos",
      "type": "row"
    }
  ],
  "preload": false,
  "schemaVersion": 40,
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-1h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "browser",
  "title": "API Dashboard",
  "uid": "ee7jgav0ff6yoa",
  "version": 1,
  "weekStart": ""
}
EOF

cat <<EOF > dashboards/Prometheus-dashboard.json
{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "grafana",
          "uid": "-- Grafana --"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "de7j7guimeo74b"
        },
        "enable": true,
        "expr": "sum(changes(prometheus_config_last_reload_success_timestamp_seconds{instance=~\"$instance\"}[10m])) by (instance)",
        "hide": false,
        "iconColor": "rgb(0, 96, 19)",
        "limit": 100,
        "name": "reloads",
        "showIn": 0,
        "step": "5m",
        "type": "alert"
      },
      {
        "datasource": {
          "type": "prometheus",
          "uid": "de7j7guimeo74b"
        },
        "enable": true,
        "expr": "count(sum(up{instance=\"$instance\"}) by (instance) < 1)",
        "hide": false,
        "iconColor": "rgba(255, 96, 96, 1)",
        "limit": 100,
        "name": "down",
        "showIn": 0,
        "step": "5m",
        "type": "alert"
      }
    ]
  },
  "description": "Get started faster with Grafana Cloud then easily build these dashboards. https://grafana.com/products/cloud/\nOverview of metrics from Prometheus 2.0.  \nUseful for using prometheus to monitor your prometheus.\nRevisions welcome!",
  "editable": true,
  "fiscalYearStartMonth": 0,
  "graphTooltip": 0,
  "id": 2,
  "links": [],
  "panels": [
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 34,
      "panels": [],
      "title": "at a glance",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "Percentage of uptime during the most recent $interval period.  Change the period with the 'interval' dropdown above.",
      "fieldConfig": {
        "defaults": {
          "decimals": 3,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 90
              },
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": 99
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 0,
        "y": 1
      },
      "id": 2,
      "maxDataPoints": 100,
      "options": {
        "colorMode": "value",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "percentChangeColorMode": "standard",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showPercentChange": false,
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "avg(avg_over_time(up{instance=~\"$instance\",job=~\"$job\"}[$interval]) * 100)",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "",
          "refId": "A",
          "step": 40
        }
      ],
      "title": "Uptime [$interval]",
      "type": "stat"
    },
    {
      "columns": [],
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "Servers which are DOWN RIGHT NOW! \nFIX THEM!!",
      "fieldConfig": {
        "defaults": {},
        "overrides": []
      },
      "fontSize": "100%",
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 6,
        "y": 1
      },
      "hideTimeOverride": true,
      "id": 25,
      "options": {},
      "pluginVersion": "11.4.0",
      "scroll": true,
      "showHeader": true,
      "sort": {
        "col": 0,
        "desc": true
      },
      "styles": [
        {
          "alias": "Time",
          "align": "auto",
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "pattern": "Time",
          "type": "hidden"
        },
        {
          "alias": "",
          "align": "auto",
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "pattern": "/__name__|job|Value/",
          "thresholds": [],
          "type": "hidden",
          "unit": "short"
        },
        {
          "alias": "   ",
          "align": "auto",
          "colorMode": "cell",
          "colors": [
            "rgba(255, 0, 0, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(255, 0, 0, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "link": false,
          "pattern": "instance",
          "thresholds": [
            "",
            "",
            ""
          ],
          "type": "string",
          "unit": "short"
        }
      ],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "up{instance=~\"$instance\",job=~\"$job\"} < 1",
          "format": "table",
          "intervalFactor": 2,
          "refId": "A",
          "step": 2
        }
      ],
      "timeFrom": "1s",
      "title": "Currently Down",
      "transform": "table",
      "type": "table-old"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "Total number of time series in prometheus",
      "fieldConfig": {
        "defaults": {
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 1000000
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 2000000
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 12,
        "y": 1
      },
      "id": 12,
      "maxDataPoints": 100,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "percentChangeColorMode": "standard",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showPercentChange": false,
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(prometheus_tsdb_head_series{job=~\"$job\",instance=~\"$instance\"})",
          "format": "time_series",
          "intervalFactor": 2,
          "refId": "B",
          "step": 40
        }
      ],
      "title": "Total Series",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "fixedColor": "rgb(31, 120, 193)",
            "mode": "fixed"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 18,
        "y": 1
      },
      "id": 14,
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "percentChangeColorMode": "standard",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showPercentChange": false,
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(prometheus_tsdb_head_chunks{job=~\"$job\",instance=~\"$instance\"})",
          "format": "time_series",
          "intervalFactor": 2,
          "refId": "B",
          "step": 40
        }
      ],
      "title": "Memory Chunks",
      "type": "stat"
    },
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 8
      },
      "id": 35,
      "panels": [],
      "title": "quick numbers",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "The total number of rule group evaluations missed due to slow rule group evaluation.",
      "fieldConfig": {
        "defaults": {
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 1
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 10
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 4,
        "x": 0,
        "y": 9
      },
      "id": 16,
      "maxDataPoints": 100,
      "options": {
        "colorMode": "value",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "percentChangeColorMode": "standard",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showPercentChange": false,
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(sum_over_time(prometheus_evaluator_iterations_missed_total{job=~\"$job\",instance=~\"$instance\"}[$interval]))",
          "format": "time_series",
          "intervalFactor": 2,
          "refId": "A",
          "step": 40
        }
      ],
      "title": "Missed Iterations [$interval]",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "The total number of rule group evaluations skipped due to throttled metric storage.",
      "fieldConfig": {
        "defaults": {
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 1
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 10
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 4,
        "x": 4,
        "y": 9
      },
      "id": 18,
      "maxDataPoints": 100,
      "options": {
        "colorMode": "value",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "percentChangeColorMode": "standard",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showPercentChange": false,
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(sum_over_time(prometheus_evaluator_iterations_skipped_total{job=~\"$job\",instance=~\"$instance\"}[$interval]))",
          "format": "time_series",
          "intervalFactor": 2,
          "refId": "A",
          "step": 40
        }
      ],
      "title": "Skipped Iterations [$interval]",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "Total number of scrapes that hit the sample limit and were rejected.",
      "fieldConfig": {
        "defaults": {
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 1
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 10
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 4,
        "x": 8,
        "y": 9
      },
      "id": 19,
      "maxDataPoints": 100,
      "options": {
        "colorMode": "value",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "percentChangeColorMode": "standard",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showPercentChange": false,
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(sum_over_time(prometheus_target_scrapes_exceeded_sample_limit_total{job=~\"$job\",instance=~\"$instance\"}[$interval]))",
          "format": "time_series",
          "intervalFactor": 2,
          "refId": "A",
          "step": 40
        }
      ],
      "title": "Tardy Scrapes [$interval]",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "Number of times the database failed to reload block data from disk.",
      "fieldConfig": {
        "defaults": {
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 1
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 10
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 4,
        "x": 12,
        "y": 9
      },
      "id": 13,
      "maxDataPoints": 100,
      "options": {
        "colorMode": "value",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "percentChangeColorMode": "standard",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showPercentChange": false,
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(sum_over_time(prometheus_tsdb_reloads_failures_total{job=~\"$job\",instance=~\"$instance\"}[$interval]))",
          "format": "time_series",
          "intervalFactor": 2,
          "refId": "A",
          "step": 40
        }
      ],
      "title": "Reload Failures [$interval]",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "Sum of all skipped scrapes",
      "fieldConfig": {
        "defaults": {
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 1
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 10
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 8,
        "x": 16,
        "y": 9
      },
      "id": 20,
      "maxDataPoints": 100,
      "options": {
        "colorMode": "value",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "percentChangeColorMode": "standard",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showPercentChange": false,
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(sum_over_time(prometheus_target_scrapes_exceeded_sample_limit_total{job=~\"$job\",instance=~\"$instance\"}[$interval])) + \nsum(sum_over_time(prometheus_target_scrapes_sample_duplicate_timestamp_total{job=~\"$job\",instance=~\"$instance\"}[$interval])) + \nsum(sum_over_time(prometheus_target_scrapes_sample_out_of_bounds_total{job=~\"$job\",instance=~\"$instance\"}[$interval])) + \nsum(sum_over_time(prometheus_target_scrapes_sample_out_of_order_total{job=~\"$job\",instance=~\"$instance\"}[$interval])) ",
          "format": "time_series",
          "intervalFactor": 2,
          "refId": "A",
          "step": 40
        }
      ],
      "title": "Skipped Scrapes [$interval]",
      "type": "stat"
    },
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 16
      },
      "id": 36,
      "panels": [],
      "title": "errors",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "All non-zero failures and errors",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Errors",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 17
      },
      "id": 33,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(net_conntrack_dialer_conn_failed_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Failed Connections",
          "refId": "A",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_evaluator_iterations_missed_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Missed Iterations",
          "refId": "B",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_evaluator_iterations_skipped_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Skipped Iterations",
          "refId": "C",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_rule_evaluation_failures_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Evaluation",
          "refId": "D",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_sd_azure_refresh_failures_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Azure Refresh",
          "refId": "E",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_sd_consul_rpc_failures_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Consul RPC",
          "refId": "F",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_sd_dns_lookup_failures_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "DNS Lookup",
          "refId": "G",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_sd_ec2_refresh_failures_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "EC2 Refresh",
          "refId": "H",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_sd_gce_refresh_failures_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "GCE Refresh",
          "refId": "I",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_sd_marathon_refresh_failures_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Marathon Refresh",
          "refId": "J",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_sd_openstack_refresh_failures_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Openstack Refresh",
          "refId": "K",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_sd_triton_refresh_failures_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Triton Refresh",
          "refId": "L",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_target_scrapes_exceeded_sample_limit_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Sample Limit",
          "refId": "M",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_target_scrapes_sample_duplicate_timestamp_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Duplicate Timestamp",
          "refId": "N",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_target_scrapes_sample_out_of_bounds_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Timestamp Out of Bounds",
          "refId": "O",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_target_scrapes_sample_out_of_order_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Sample Out of Order",
          "refId": "P",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_treecache_zookeeper_failures_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Zookeeper",
          "refId": "Q",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_tsdb_compactions_failed_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "TSDB Compactions",
          "refId": "R",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_tsdb_head_series_not_found{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Series Not Found",
          "refId": "S",
          "step": 2
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(increase(prometheus_tsdb_reloads_failures_total{instance=~\"$instance\"}[5m])) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Reload",
          "refId": "T",
          "step": 2
        }
      ],
      "title": "Failures and Errors",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 24
      },
      "id": 37,
      "panels": [],
      "title": "up",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Up",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "normal"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "decimals": 0,
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 0,
        "y": 25
      },
      "id": 1,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "up{instance=~\"$instance\",job=~\"$job\"}",
          "format": "time_series",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "{{instance}}",
          "refId": "A",
          "step": 2
        }
      ],
      "title": "Upness (stacked)",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Chunks",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 12,
        "y": 25
      },
      "id": 5,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "prometheus_tsdb_head_chunks{job=~\"$job\",instance=~\"$instance\"}",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{instance}}",
          "refId": "A",
          "step": 4
        }
      ],
      "title": "Storage Memory Chunks",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 32
      },
      "id": 38,
      "panels": [],
      "title": "series",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Series",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 0,
        "y": 33
      },
      "id": 3,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "prometheus_tsdb_head_series{job=~\"$job\",instance=~\"$instance\"}",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{instance}}",
          "refId": "A",
          "step": 4
        }
      ],
      "title": "Series Count",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Series Count",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": [
          {
            "matcher": {
              "id": "byName",
              "options": "removed"
            },
            "properties": [
              {
                "id": "custom.transform",
                "value": "negative-Y"
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 12,
        "y": 33
      },
      "id": 32,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum( increase(prometheus_tsdb_head_series_created_total{instance=~\"$instance\"}[5m]) )",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "created",
          "refId": "A",
          "step": 4
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum( increase(prometheus_tsdb_head_series_removed_total{instance=~\"$instance\"}[5m]) )",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "removed",
          "refId": "B",
          "step": 4
        }
      ],
      "title": "Series Created / Removed",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 40
      },
      "id": 39,
      "panels": [],
      "title": "appended samples",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "Rate of total number of appended samples",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Samples / Second",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": [
          {
            "matcher": {
              "id": "byName",
              "options": "10.58.3.10:80"
            },
            "properties": [
              {
                "id": "color",
                "value": {
                  "fixedColor": "#BA43A9",
                  "mode": "fixed"
                }
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 41
      },
      "id": 4,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "rate(prometheus_tsdb_head_samples_appended_total{job=~\"$job\",instance=~\"$instance\"}[1m])",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{instance}}",
          "refId": "A",
          "step": 2
        }
      ],
      "title": "Appended Samples per Second",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 48
      },
      "id": 40,
      "panels": [],
      "title": "sync",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "Total number of syncs that were executed on a scrape pool.",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Syncs",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 0,
        "y": 49
      },
      "id": 6,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(prometheus_target_scrape_pool_sync_total{job=~\"$job\",instance=~\"$instance\"}) by (scrape_job)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "{{scrape_job}}",
          "refId": "B",
          "step": 4
        }
      ],
      "title": "Scrape Sync Total",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "Actual interval to sync the scrape pool.",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Milliseconds",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 12,
        "y": 49
      },
      "id": 21,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(rate(prometheus_target_sync_length_seconds_sum{job=~\"$job\",instance=~\"$instance\"}[2m])) by (scrape_job) * 1000",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{scrape_job}}",
          "refId": "A",
          "step": 4
        }
      ],
      "title": "Target Sync",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 56
      },
      "id": 41,
      "panels": [],
      "title": "scrapes",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Seconds",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 0,
        "y": 57
      },
      "id": 29,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "scrape_duration_seconds{instance=~\"$instance\"}",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{instance}}",
          "refId": "A",
          "step": 4
        }
      ],
      "title": "Scrape Duration",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "Total number of rejected scrapes",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Scrapes",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "decimals": 0,
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 12,
        "y": 57
      },
      "id": 30,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(prometheus_target_scrapes_exceeded_sample_limit_total{job=~\"$job\",instance=~\"$instance\"})",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "exceeded sample limit",
          "refId": "A",
          "step": 4
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(prometheus_target_scrapes_sample_duplicate_timestamp_total{job=~\"$job\",instance=~\"$instance\"})",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "duplicate timestamp",
          "refId": "B",
          "step": 4
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(prometheus_target_scrapes_sample_out_of_bounds_total{job=~\"$job\",instance=~\"$instance\"})",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "out of bounds",
          "refId": "C",
          "step": 4
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(prometheus_target_scrapes_sample_out_of_order_total{job=~\"$job\",instance=~\"$instance\"}) ",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "out of order",
          "refId": "D",
          "step": 4
        }
      ],
      "title": "Rejected Scrapes",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 64
      },
      "id": 42,
      "panels": [],
      "title": "durations",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "The duration of rule group evaluations",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Milliseconds",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 0,
        "y": 65
      },
      "id": 10,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "1000 * rate(prometheus_evaluator_duration_seconds_sum{job=~\"$job\", instance=~\"$instance\"}[5m]) / rate(prometheus_evaluator_duration_seconds_count{job=~\"$job\", instance=~\"$instance\"}[5m])",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{instance}}",
          "refId": "E",
          "step": 4
        }
      ],
      "title": "Average Rule Evaluation Duration",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Microseconds",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 12,
        "y": 65
      },
      "id": 11,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(rate(http_request_duration_microseconds_count{job=~\"$job\",instance=~\"$instance\"}[1m])) by (handler) > 0",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{handler}}",
          "refId": "A",
          "step": 4
        }
      ],
      "title": "HTTP Request Duration",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Seconds",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 0,
        "y": 72
      },
      "id": 15,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(prometheus_engine_query_duration_seconds_sum{job=~\"$job\",instance=~\"$instance\"}) by (slice)",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{slice}}",
          "refId": "A",
          "step": 4
        }
      ],
      "title": "Prometheus Engine Query Duration Seconds",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "Rule-group evaluations \n - total\n - missed due to slow rule group evaluation\n - skipped due to throttled metric storage",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "iterations",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 12,
        "y": 72
      },
      "id": 31,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(rate(prometheus_evaluator_iterations_total{job=~\"$job\", instance=~\"$instance\"}[5m]))",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Total",
          "refId": "B",
          "step": 4
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(rate(prometheus_evaluator_iterations_missed_total{job=~\"$job\", instance=~\"$instance\"}[5m]))",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Missed",
          "refId": "A",
          "step": 4
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(rate(prometheus_evaluator_iterations_skipped_total{job=~\"$job\", instance=~\"$instance\"}[5m]))",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Skipped",
          "refId": "C",
          "step": 4
        }
      ],
      "title": "Rule Evaluator Iterations",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 79
      },
      "id": 43,
      "panels": [],
      "title": "notifications",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Notifications",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 80
      },
      "id": 22,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "rate(prometheus_notifications_sent_total[5m])",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{instance}}",
          "refId": "A",
          "step": 2
        }
      ],
      "title": "Notifications Sent",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 87
      },
      "id": 44,
      "panels": [],
      "title": "config",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Minutes",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 0,
        "y": 88
      },
      "id": 23,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "(time() - prometheus_config_last_reload_success_timestamp_seconds{job=~\"$job\",instance=~\"$instance\"}) / 60",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{instance}}",
          "refId": "A",
          "step": 4
        }
      ],
      "title": "Minutes Since Successful Config Reload",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "Success",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "decimals": 0,
          "mappings": [],
          "max": 1,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 12,
        "y": 88
      },
      "id": 24,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "prometheus_config_last_reload_successful{job=~\"$job\",instance=~\"$instance\"}",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{instance}}",
          "refId": "A",
          "step": 4
        }
      ],
      "title": "Successful Config Reload",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 95
      },
      "id": 45,
      "panels": [],
      "title": "garbage collection",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "de7j7guimeo74b"
      },
      "description": "GC invocation durations",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 10,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 96
      },
      "id": 28,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "11.4.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "expr": "sum(rate(go_gc_duration_seconds_sum{instance=~\"$instance\",job=~\"$job\"}[2m])) by (instance)",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{instance}}",
          "refId": "A",
          "step": 2
        }
      ],
      "title": "GC Rate / 2m",
      "type": "timeseries"
    },
    {
      "collapsed": true,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 103
      },
      "id": 46,
      "panels": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "description": "This is probably wrong!  Please help.",
          "fieldConfig": {
            "defaults": {},
            "overrides": []
          },
          "gridPos": {
            "h": 7,
            "w": 12,
            "x": 0,
            "y": 104
          },
          "id": 26,
          "options": {},
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_alloc_bytes_total{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "alloc_bytes_total",
              "refId": "A",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_alloc_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "allocated",
              "refId": "B",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_buck_hash_sys_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "profiling bucket hash table",
              "refId": "C",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_gc_sys_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "GC metadata",
              "refId": "D",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_heap_alloc_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "heap in-use",
              "refId": "E",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_heap_idle_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "heap idle",
              "refId": "F",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_heap_inuse_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "heap in use",
              "refId": "G",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_heap_released_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "heap released",
              "refId": "H",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_heap_sys_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "heap system",
              "refId": "I",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_mcache_inuse_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "mcache in use",
              "refId": "J",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_mcache_sys_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "mcache sys",
              "refId": "K",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_mspan_inuse_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "mspan in use",
              "refId": "L",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_mspan_sys_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "mspan sys",
              "refId": "M",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_next_gc_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "heap next gc",
              "refId": "N",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_other_sys_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "other sys",
              "refId": "O",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_stack_inuse_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "stack in use",
              "refId": "P",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_stack_sys_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "stack sys",
              "refId": "Q",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(go_memstats_sys_bytes{job=~\"$job\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "sys",
              "refId": "R",
              "step": 10
            }
          ],
          "title": "Go Memory Usage (FIXME)",
          "type": "timeseries"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "fieldConfig": {
            "defaults": {},
            "overrides": []
          },
          "gridPos": {
            "h": 7,
            "w": 6,
            "x": 12,
            "y": 104
          },
          "id": 9,
          "options": {},
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "prometheus_target_interval_length_seconds{instance=~\"$instance\", job=~\"$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{quantile}} {{interval}}",
              "refId": "A",
              "step": 20
            }
          ],
          "title": "Scrape Duration",
          "type": "timeseries"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "de7j7guimeo74b"
          },
          "fieldConfig": {
            "defaults": {},
            "overrides": []
          },
          "gridPos": {
            "h": 7,
            "w": 6,
            "x": 18,
            "y": 104
          },
          "id": 7,
          "options": {},
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "de7j7guimeo74b"
              },
              "expr": "sum(rate(prometheus_target_interval_length_seconds_count{job=~\"$job\",instance=~\"$instance\"}[5m])) by (interval)",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{interval}}",
              "refId": "A",
              "step": 20
            }
          ],
          "title": "Target Scrapes / 5m",
          "type": "timeseries"
        }
      ],
      "title": "Broken, ignore",
      "type": "row"
    }
  ],
  "preload": false,
  "refresh": "30s",
  "schemaVersion": 40,
  "tags": [],
  "templating": {
    "list": [
      {
        "current": {
          "text": [
            "All"
          ],
          "value": [
            "$__all"
          ]
        },
        "datasource": "de7j7guimeo74b",
        "includeAll": true,
        "multi": true,
        "name": "job",
        "options": [],
        "query": "query_result(prometheus_tsdb_head_samples_appended_total)",
        "refresh": 2,
        "regex": "/.*job=\"([^\"]+)/",
        "sort": 1,
        "type": "query"
      },
      {
        "current": {
          "text": [
            "All"
          ],
          "value": [
            "$__all"
          ]
        },
        "datasource": "de7j7guimeo74b",
        "includeAll": true,
        "multi": true,
        "name": "instance",
        "options": [],
        "query": "query_result(up{job=~\"$job\"})",
        "refresh": 2,
        "regex": "/.*instance=\"([^\"]+).*/",
        "type": "query"
      },
      {
        "current": {
          "text": "1h",
          "value": "1h"
        },
        "includeAll": false,
        "name": "interval",
        "options": [
          {
            "selected": true,
            "text": "1h",
            "value": "1h"
          },
          {
            "selected": false,
            "text": "3h",
            "value": "3h"
          },
          {
            "selected": false,
            "text": "6h",
            "value": "6h"
          },
          {
            "selected": false,
            "text": "12h",
            "value": "12h"
          },
          {
            "selected": false,
            "text": "1d",
            "value": "1d"
          },
          {
            "selected": false,
            "text": "2d",
            "value": "2d"
          },
          {
            "selected": false,
            "text": "7d",
            "value": "7d"
          },
          {
            "selected": false,
            "text": "30d",
            "value": "30d"
          },
          {
            "selected": false,
            "text": "90d",
            "value": "90d"
          },
          {
            "selected": false,
            "text": "180d",
            "value": "180d"
          }
        ],
        "query": "1h, 3h, 6h, 12h, 1d, 2d, 7d, 30d, 90d, 180d",
        "type": "custom"
      }
    ]
  },
  "time": {
    "from": "now-30m",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Prometheus 2.0 Overview",
  "uid": "de7jgi1re9v5sd",
  "version": 1,
  "weekStart": ""
}
EOF
kubectl apply -f k8s-manifests/grafana-deployment.yaml
echo "Provisionamento concluído: datasource.yaml, dashboards.yaml e dashboard de exemplo criados. Reload do grafana realizado!!"
echo "deletando os arquivos apos serem utilizados"
rm dashboards.yaml
rm datasource.yaml
