{{- /* Define CSIDriver object with sub-feature flags */}}
{{- define "quobyte-csi-driver.CSIDriverObject" }}
---
{{- if semverCompare ">=1.19.0-0" .Capabilities.KubeVersion.Version }}
apiVersion: storage.k8s.io/v1
{{- else }}
apiVersion: storage.k8s.io/v1beta1  
{{- end }}
kind: CSIDriver
metadata:
  name: {{ .Values.quobyte.csiProvisionerName }}
spec:
  attachRequired: false
  podInfoOnMount: false
  fsGroupPolicy: None
  {{- if semverCompare ">=1.20.0-0" .Capabilities.KubeVersion.Version }}
  requiresRepublish: false
  {{- end }}
  volumeLifecycleModes:
    - Persistent
---
{{- end }}
