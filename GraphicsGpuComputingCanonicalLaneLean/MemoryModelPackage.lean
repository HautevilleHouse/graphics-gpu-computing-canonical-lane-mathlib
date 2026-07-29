import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure MemoryModelPackage where
  coherenceProtocol : Prop
  consistencyModel : Prop
  memoryOrdering : Prop
  synchronizationPrimitive : Prop
  coherenceProtocolClosed : coherenceProtocol
  consistencyModelClosed : consistencyModel
  memoryOrderingClosed : memoryOrdering
  synchronizationPrimitiveClosed : synchronizationPrimitive

structure MemoryModelEvidence (M : MemoryModelPackage) where
  coherenceProtocolClosed : M.coherenceProtocol
  consistencyModelClosed : M.consistencyModel
  memoryOrderingClosed : M.memoryOrdering
  synchronizationPrimitiveClosed : M.synchronizationPrimitive

def MemoryModelClosed (M : MemoryModelPackage) : Prop :=
  M.coherenceProtocol ∧ M.consistencyModel ∧ M.memoryOrdering ∧ M.synchronizationPrimitive

theorem memory_model_closed_from_evidence (M : MemoryModelPackage) (E : MemoryModelEvidence M) : MemoryModelClosed M := by
  exact And.intro E.coherenceProtocolClosed (And.intro E.consistencyModelClosed (And.intro E.memoryOrderingClosed E.synchronizationPrimitiveClosed))

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse