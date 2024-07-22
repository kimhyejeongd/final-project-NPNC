package com.project.npnc.admin.document.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminDocument {
    private int erStorageKey;
    private int erStorageFolderKey;
    private String erStorageName;
    private int erStorageTerm;
    private int erStorageManager;
    private int erStorageOrderby;
}
