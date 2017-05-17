﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abiturient.DataTransferObjects
{
    [Serializable]
    public class FamStateInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор семейного положения
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название семейного положения
        /// </summary>
        public string Name { get; set; }
    }
}