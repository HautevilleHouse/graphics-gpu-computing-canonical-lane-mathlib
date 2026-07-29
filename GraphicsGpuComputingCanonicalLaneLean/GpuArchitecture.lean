import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GpuArchitecture where
  streamingMultiprocessor : Type
  memoryController : Type
  l2Cache : Type
  pcieInterface : Type
  clockSpeed : Type
  architectureSpecified : Prop
  streamingMultiprocessorClosed : streamingMultiprocessor
  memoryControllerClosed : memoryController
  l2CacheClosed : l2Cache
  pcieInterfaceClosed : pcieInterface
  clockSpeedClosed : clockSpeed
  architectureSpecifiedClosed : architectureSpecified

structure GpuArchitectureEvidence (A : GpuArchitecture) where
  streamingMultiprocessorClosed : A.streamingMultiprocessor
  memoryControllerClosed : A.memoryController
  l2CacheClosed : A.l2Cache
  pcieInterfaceClosed : A.pcieInterface
  clockSpeedClosed : A.clockSpeed
  architectureSpecifiedClosed : A.architectureSpecified

def GpuArchitectureClosed (A : GpuArchitecture) : Prop :=
  A.streamingMultiprocessor ∧ A.memoryController ∧ A.l2Cache ∧ A.pcieInterface ∧ A.clockSpeed ∧ A.architectureSpecified

theorem gpu_architecture_closed_from_evidence (A : GpuArchitecture) (E : GpuArchitectureEvidence A) : GpuArchitectureClosed A := by
  exact And.intro E.streamingMultiprocessorClosed (And.intro E.memoryControllerClosed (And.intro E.l2CacheClosed (And.intro E.pcieInterfaceClosed (And.intro E.clockSpeedClosed E.architectureSpecifiedClosed))))

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse