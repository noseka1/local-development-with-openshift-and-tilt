# push the container image to the CRC internal registry, project tilt-example
default_registry(
  'default-route-openshift-image-registry.apps-crc.testing/tilt-example',
  host_from_cluster='image-registry.openshift-image-registry.svc:5000/tilt-example')

# use buildah to build and push the container image
custom_build(
  'example-html-image',
  'buildah build-using-dockerfile --tag $EXPECTED_REF . && buildah push $EXPECTED_REF',
  ['.'],
  skips_local_docker=True)

# deploy Kubernetes resource
k8s_yaml('kubernetes.yaml')

# make the application available on localhost:8000
k8s_resource('example-html', port_forwards=8000)
